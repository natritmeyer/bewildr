#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module RangeValuePattern
      def value
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.value
      end

      def maximum
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.maximum
      end

      def minimum
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.minimum
      end
    end
  end
end
