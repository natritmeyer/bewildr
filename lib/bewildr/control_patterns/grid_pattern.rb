#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module GridPattern
      def row_count
        @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).current.row_count.to_i
      end

      def column_count
        @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).current.column_count.to_i
      end

      def get_item(row, column)
        item = @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).get_item(row, column)
        Bewildr::Element.new(item)
      end
    end
  end
end
