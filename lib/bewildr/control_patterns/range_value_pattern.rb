#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns #:nodoc:
    module RangeValuePattern
      #Returns the current value of the element
      def value
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.value.to_f
      end

      #Sets the value of the element
      def value=(input)
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).set_value(input.to_f)
      end

      #Returns the maximum value of the element
      def maximum
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.maximum.to_f
      end

      #Returns the minimum value of the element
      def minimum
        @automation_element.get_current_pattern(System::Windows::Automation::RangeValuePattern.pattern).current.minimum.to_f
      end
    end
  end
end
