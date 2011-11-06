#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns #:nodoc:
    module SelectionPattern
      #Returns the elements that are selected
      def get_selection
        my_selected_items = @automation_element.get_current_pattern(System::Windows::Automation::SelectionPattern.pattern).current.get_selection

        c_array_list = System::Collections::ArrayList.new(my_selected_items)
        item_array = c_array_list.to_array.to_a

        return [] if item_array.size == 0
        item_array.to_a.collect {|item| Bewildr::Element.new(item)}
      end

      #Returns true if more than one selection is possible, false if it's not
      def multi_selectable?
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionPattern.pattern).current.can_select_multiple
      end
      alias :can_select_multiple? :multi_selectable?

      #Returns the (first - if relevant) selected item
      def selected
        multi_selectable? ? get_selection : get_selection.first
      end
    end
  end
end