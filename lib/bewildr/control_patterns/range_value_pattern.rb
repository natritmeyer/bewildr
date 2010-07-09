#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module RangeValuePattern
      def value
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.value.to_f
      end

      def value=(input)
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).set_value(input.to_f)
      end

      def maximum
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.maximum.to_f
      end

      def minimum
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.minimum.to_f
      end
    end
  end
end
