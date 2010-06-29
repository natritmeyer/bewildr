#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module TableItemPattern
      def row_span
        @automation_element.get_current_pattern(System::Windows::Automation::TableItemPattern.pattern).current.row_span.to_i
      end

      def column_span
        @automation_element.get_current_pattern(System::Windows::Automation::TableItemPattern.pattern).current.column_span.to_i
      end
    end
  end
end
