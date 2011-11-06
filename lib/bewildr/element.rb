#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  #All MS UI Automation elements accessed using bewildr are represented as instances of Bewildr::Element.
  class Element
    attr_reader :automation_element
    attr_reader :control_type
    
    #Returns a new instance of Bewildr::Element wrapping the MS UI Automation Element passed in as an
    #argument. You probably won't be calling this method directly - if you are then you probably know
    #what your'e doing
    def initialize(input)
      @automation_element = input
      case input
      when System::Windows::Automation::AutomationElement
        set_control_type
        build_element
        include_additions
      when nil then @control_type = :non_existent
      else raise Bewildr::BewildrInternalError, "Can only initialize an element with a nil or a Sys::Win::Auto::AE[C], not a #{input.class}"
      end
    end

    #Returns the underlying automation element's name property
    def name
      existence_check
      @automation_element.current.name.to_s
    end

    #Returns the underlying automation element's automation id property
    def automation_id
      existence_check
      @automation_element.current.automation_id.to_s
    end

    #Returns true if the element exists, false if it doesn't
    def exists?
      return false if @control_type == :non_existent
      begin
        @automation_element.current.bounding_rectangle
        return true
      rescue System::Windows::Automation::ElementNotAvailableException, TypeError => e
        return false
      end
    end
    alias :exist? :exists?

    #Returns true if the element is visible, false if it isn't
    def visible?
      existence_check
      !@automation_element.current.is_offscreen
    end

    #Returns true if this element has a descendant that meets the search criteria, false if it doesn't
    #Takes a condition hash
    def contains?(condition_hash)
      get(condition_hash).exists?
    end
    alias :contain? :contains?

    #Returns true if the underlying automation element is enabled, false if it's not
    def enabled?
      existence_check
      @automation_element.current.is_enabled
    end

    #Waits up to 30 seconds for a descendant of this element to exist that meets the search criteria, returns the element if found
    def wait_for_existence_of(condition_hash)
      Timeout.timeout(30) do
        sleep 0.1 until contains?(condition_hash)
      end
      get(condition_hash)
    end
    alias :wait_for :wait_for_existence_of

    #Waits for up to 30 seconds for this element to no longer have a descendant element that meest the criteria
    def wait_for_non_existence_of(condition_hash)
      Timeout.timeout(30) do
        sleep 0.1 unless contains?(condition_hash)
      end
    end

    #Gives this element focus
    def focus
      @automation_element.set_focus
    end

    #Returns true if this element is scrollable, false if it isn't.
    def scrollable?
      return false unless @automation_element.get_supported_patterns.collect {|pattern| pattern.programmatic_name.to_s }.include?("ScrollPatternIdentifiers.Pattern")
      vertically_scrollable
    end

    #Returns the result of searching this element's children or descendants for the first or all matches of
    #a particular id, name or type (or combination!). See Bewildr::Finder for more details
    #  :id => "id"
    #  :name => "bob"
    #  :type => :button
    #  :scope => :children / :descendants
    #  :how_many => :first / :all
    def get(condition_hash)
      existence_check
      condition = Finder.condition_for(condition_hash)
      scope = Finder.scope_for(condition_hash)
      how_many = Finder.how_many_for(condition_hash)
      
      result = @automation_element.send how_many, scope, condition
      case result
      when System::Windows::Automation::AutomationElement, nil then return Bewildr::Element.new(result)
      when System::Windows::Automation::AutomationElementCollection
        System::Collections::ArrayList.new(result).to_array.to_a.collect {|element| Bewildr::Element.new(element) }
      end
    end

    #Returns true if this element is the root element of the UI element tree
    def root?
      @automation_element == System::Windows::Automation::AutomationElement.root_element
    end

    #Returns a new element representing this element's parent in the UI element tree
    def parent
      return nil if root?
      walker = System::Windows::Automation::TreeWalker.RawViewWalker
      potential_parent = walker.get_parent(@automation_element)
      Bewildr::Element.new(potential_parent)
    end

    #Returns true if this element has descendants, false if it doesn't
    def has_children?
      walker = System::Windows::Automation::TreeWalker.RawViewWalker
      !walker.get_first_child(@automation_element).nil?
    end

    #Returns an array containing this element's (direct) children
    def children
      return [] unless has_children?
      walker = System::Windows::Automation::TreeWalker.ControlViewWalker #RawViewWalker
      bewildred_children = []
      child = walker.get_first_child(@automation_element)
      while !child.nil? do
        bewildred_children << Bewildr::Element.new(child)
        child = walker.get_next_sibling(child)
      end
      bewildred_children
    end

    #Returns the current element's next sibling, or nil if there is no next sibling
    def next_sibling
      walker = System::Windows::Automation::TreeWalker.ControlViewWalker
      potential_next_sibling = walker.get_next_sibling(@automation_element)
      potential_next_sibling.nil? ? nil : Bewildr::Element.new(potential_next_sibling)
    end

    #Returns the current element's previous sibling, or nil if there is no previous sibling
    def previous_sibling
      walker = System::Windows::Automation::TreeWalker.ControlViewWalker
      potential_previous_sibling = walker.get_previous_sibling(@automation_element)
      potential_previous_sibling.nil? ? nil : Bewildr::Element.new(potential_previous_sibling)
    end

    #Clicks this element - this is done by actual mouse moves and clicks. The automation element's underlying InvokePattern is not used.
    def click
      Bewildr::Mouse.click(clickable_point)
    end

    #Double clicks this element - this is done by actual mouse moves and clicks. The automation element's underlying InvokePattern is not used.
    def double_click
      Bewildr::Mouse.double_click(clickable_point)
    end

    #Right clicks this element - this is done by actual mouse moves and clicks. The automation element's underlying InvokePattern is not used.
    def right_click
      Bewildr::Mouse.right_click(clickable_point)
    end

    #Returns the underlying automation element's clickable point property - this is used by the various click methods
    def clickable_point
      existence_check
      Timeout.timeout(30) do
        current_clickable_point = nil
        begin
          current_clickable_point = @automation_element.get_clickable_point
        rescue System::Windows::Automation::NoClickablePointException
          retry
        end
        return current_clickable_point
      end
    end

    #Returns the height of the element in pixels
    def height
      @automation_element.current.bounding_rectangle.height.to_i
    end

    #Returns the width of the element in pixels
    def width
      @automation_element.current.bounding_rectangle.width.to_i
    end

	#Drags this element to a target element; optionally via a different element. Takes a hash with the following:
	#  :to => some_element
	#  :via => another_element (optional)
	#  :wait_at_via_for => seconds (optional)
	#Eg:
	#  my_element.drag :to => some_element
	#or...
	#  my_element.drag :via => another_element, :to => some_element
	#or, if you need to hover over the via_element for 2.5 seconds:
    #  my_element.drag :via => another_element, :to => some_element, :wait_at_via_for => 2.5
	def drag(target_details)
	  drag_args = target_details
	  drag_args[:from] = self
      Bewildr::Mouse.drag(drag_args)
	end

    private

    #Raises an exception if this element no longer exists
    def existence_check
      raise Bewildr::ElementDoesntExist unless exists?
    end

    #Used to add scrollability to an element if it becomes scrollable subsequent to its initial discovery
    def prepare_element
      load_all_items_hack if scrollable?
    end

    #Figures out this element's control type
    def set_control_type
      @control_type = Bewildr::ControlType.symbol_for_enum(@automation_element.current.control_type)
    end

    #Mixes in bewildr control patterns dynamically based on what patterns the underlying automation element has
    def build_element
      @automation_element.get_supported_patterns.each do |pattern|
        pattern_name = pattern.programmatic_name.to_s.gsub(/Identifiers\.Pattern/, "")
        potential_pattern = Bewildr::ControlPatterns.submodules.select {|mod| mod.name =~ /#{pattern_name}$/}.first
        extend(potential_pattern) unless potential_pattern.nil?
      end
    end

    #Adds control type addition modules to this element based on the underlying automation element's control type.
    #list of control types comes from http://msdn.microsoft.com/en-us/library/ms750574.aspx
    def include_additions
      #the following looks like could have performance issues, but the tests don't take any longer to execute...
      potential_addition = Bewildr::ControlTypeAdditions.submodules.select {|mod| mod.name.demodulize == "#{@control_type.to_s.classify}Additions"}.first
      extend potential_addition unless potential_addition.nil?

      #non-standards - move this to another method in the near future
      extend Bewildr::ControlTypeAdditions::TextAdditions if @control_type == :hyperlink

      #add scrolling capability if relevant - TODO: this ugliness will be fixed later
      if @automation_element.get_supported_patterns.collect {|pattern| pattern.programmatic_name.to_s }.include?("ScrollPatternIdentifiers.Pattern")
        extend Bewildr::ControlTypeAdditions::ScrollAdditions
      end
    end
  end
end
