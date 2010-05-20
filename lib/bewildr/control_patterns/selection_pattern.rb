#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module SelectionPattern
      def get_selection
        my_selected_items = @automation_element.get_current_pattern(System::Windows::Automation::SelectionPattern.pattern).current.get_selection

        c_array_list = System::Collections::ArrayList.new(my_selected_items)
        item_array = c_array_list.to_array.to_a

        return [] if item_array.size == 0
        item_array.to_a.collect {|item| Bewildr::Element.new(item)}
      end

      def can_select_multiple?
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionPattern.pattern).current.can_select_multiple
      end

      def selected
        can_select_multiple? ? get_selection : get_selection.first
      end
    end
  end
end