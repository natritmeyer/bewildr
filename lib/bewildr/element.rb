#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  class Element
    attr_reader :automation_element
    attr_reader :control_type
    
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

    def name
      existence_check
      @automation_element.current.name.to_s
    end

    def automation_id
      existence_check
      @automation_element.current.automation_id.to_s
    end

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

    def contains?(condition_hash)
      get(condition_hash).exists?
    end
    alias :contain? :contains?

    def enabled?
      existence_check
      @automation_element.current.is_enabled
    end

    def wait_for_existence_of(condition_hash)
      Timeout.timeout(30) do
        sleep 0.1 until contains?(condition_hash)
      end
      get(condition_hash)
    end

    def wait_for_non_existence_of(condition_hash)
      Timeout.timeout(30) do
        sleep 0.1 unless contains?(condition_hash)
      end
    end

    def focus
      @automation_element.set_focus
    end

    def scrollable?
      return false unless @automation_element.get_supported_patterns.collect {|pattern| pattern.programmatic_name.to_s }.include?("ScrollPatternIdentifiers.Pattern")
      vertically_scrollable
    end

    #:id => "id"
    #:name => "bob"
    #:type => :button
    #:scope => :children / :descendants
    #:how_many => :first / :all
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

    #add "children/child" and "descendants/descendant" methods

    def root?
      @automation_element == System::Windows::Automation::AutomationElement.root_element
    end

    def parent
      return nil if root?
      walker = System::Windows::Automation::TreeWalker.RawViewWalker
      potential_parent = walker.get_parent(@automation_element)
      Bewildr::Element.new(potential_parent)
    end

    def has_children?
      walker = System::Windows::Automation::TreeWalker.RawViewWalker
      !walker.get_first_child(@automation_element).nil?
    end

    def children
      #get({:scope => :children}).collect {|element| Bewildr::Element.new(element)}
      return [] unless has_children?
    end

    def click
      CLICKR.click(clickable_point)
    end

    def double_click
      CLICKR.double_click(clickable_point)
    end

    def right_click
      CLICKR.right_click(clickable_point)
    end

    private

    def existence_check
      raise Bewildr::ElementDoesntExist unless exists?
    end

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

    def prepare_element
      load_all_items_hack if scrollable?
    end

    def set_control_type
      @control_type = Bewildr::ControlType.symbol_for_enum(@automation_element.current.control_type)
    end

    def build_element
      @automation_element.get_supported_patterns.each do |pattern|
        pattern_name = pattern.programmatic_name.to_s.gsub(/Identifiers\.Pattern/, "")
        potential_pattern = Bewildr::ControlPatterns.submodules.select {|mod| mod.name =~ /#{pattern_name}$/}.first
        extend(potential_pattern) unless potential_pattern.nil?
      end
    end

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
