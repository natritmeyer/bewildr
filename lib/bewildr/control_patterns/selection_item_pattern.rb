# To change this template, choose Tools | Templates
# and open the template in the editor.

module Bewildr
  module ControlPatterns
    module SelectionItemPattern
      def select
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionItemPattern.pattern).select
      end

      def selected?
        @automation_element.get_current_pattern(System::Windows::Automation::SelectionItemPattern.pattern).current.is_selected
      end

      def unselected?
        !selected?
      end
    end
  end
end
