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

    #Waits up to 30 seconds for a descendant of this element to exist that meets the search criteria
    def wait_for_existence_of(condition_hash)
      Timeout.timeout(30) do
        sleep 0.1 until contains?(condition_hash)
      end
      get(condition_hash)
    end

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
        c_array_list = System::Collections::ArrayList.new(result)
        element_array = c_array_list.to_array.to_a
        case
        when element_array.size == 0 then return Bewildr::Element.new(nil)
        when element_array.size > 0 then return element_array.collect {|element| Bewildr::Element.new(element) }
        end
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

    #Clicks this element - this is done by actual mouse moves and clicks. The automation element's underlying InvokePattern is not used.
    def click
      CLICKR.click(clickable_point)
    end

    #Double clicks this element - this is done by actual mouse moves and clicks. The automation element's underlying InvokePattern is not used.
    def double_click
      CLICKR.double_click(clickable_point)
    end

    #Right clicks this element - this is done by actual mouse moves and clicks. The automation element's underlying InvokePattern is not used.
    def right_click
      CLICKR.right_click(clickable_point)
    end

    private

    #Raises an exception if this element no longer exists
    def existence_check
      raise Bewildr::ElementDoesntExist unless exists?
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

    #Adds control type addition modules to this element based on the underlying automation element's control
    #type. This method will become more dynamic in the near future
    #list of control types comes from http://msdn.microsoft.com/en-us/library/ms750574.aspx
    def include_additions
      case @control_type
      when :combo_box then extend Bewildr::ControlTypeAdditions::ComboBoxAdditions
      when :data_grid then extend Bewildr::ControlTypeAdditions::DataGridAdditions
      when :document  then extend Bewildr::ControlTypeAdditions::DocumentAdditions
      when :hyperlink then extend Bewildr::ControlTypeAdditions::TextAdditions
      when :list      then extend Bewildr::ControlTypeAdditions::ListAdditions
      when :menu      then extend Bewildr::ControlTypeAdditions::MenuAdditions
      when :menu_item then extend Bewildr::ControlTypeAdditions::MenuItemAdditions
      when :tab       then extend Bewildr::ControlTypeAdditions::TabAdditions
      when :text      then extend Bewildr::ControlTypeAdditions::TextAdditions
      when :tree      then extend Bewildr::ControlTypeAdditions::TreeAdditions
      when :tree_item then extend Bewildr::ControlTypeAdditions::TreeItemAdditions
      when :window    then extend Bewildr::ControlTypeAdditions::WindowAdditions
      end 

      #add scrolling capability if relevant - TODO: this ugliness will be fixed later
      if @automation_element.get_supported_patterns.collect {|pattern| pattern.programmatic_name.to_s }.include?("ScrollPatternIdentifiers.Pattern")
        extend Bewildr::ControlTypeAdditions::ScrollAdditions
      end
    end
  end
end
