#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module GridPattern
      def row_count
        @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).current.row_count
      end

      def column_count
        @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).current.column_count
      end
    end
  end
end
