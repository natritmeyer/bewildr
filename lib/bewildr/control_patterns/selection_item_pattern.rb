# To change this template, choose Tools | Templates
# and open the template in the editor.

module Bewildr
  module ControlPatterns #:nodoc:
    module SelectionItemPattern
      #Selects the element
      def select
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionItemPattern.pattern).select
      end

      #Returns true if the element is selected, false if it's not
      def selected?
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionItemPattern.pattern).current.is_selected
      end

      #Returns false if the element is selected, true if it's not
      def unselected?
        !selected?
      end
    end
  end
end
