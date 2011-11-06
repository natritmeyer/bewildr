#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns #:nodoc:
    module GridPattern
      #Returns the number of rows in the grid
      def row_count
        @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).current.row_count.to_i
      end

      #Returns the number of columns in the grid
      def column_count
        @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).current.column_count.to_i
      end

      #Returns an item from the grid
      def get_item(row, column)
        item = @automation_element.get_current_pattern(System::Windows::Automation::GridPattern.pattern).get_item(row, column)
        Bewildr::Element.new(item)
      end
    end
  end
end
