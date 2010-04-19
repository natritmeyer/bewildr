# To change this template, choose Tools | Templates
# and open the template in the editor.

module Bewildr
  module ControlPatterns
    module SelectionItemPattern
      def select
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionItemPattern.pattern).select
      end

      def is_selected?
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionItemPattern.pattern).current.is_selected
      end

      def selected?
        is_selected?
      end

      def unselected?
        !is_selected?
      end
    end
  end
end
