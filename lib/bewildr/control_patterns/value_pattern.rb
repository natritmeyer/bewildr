#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module ValuePattern
      def is_password_field?
        @automation_element.current.class_name.to_s == "PasswordBox" ? true : false
      end

      def text
        raise PasswordFieldReadAttempt, "You can't get the text of a password field" if is_password_field?
        @automation_element.get_current_pattern(System::Windows::Automation::ValuePattern.pattern).current.value.to_s
      end

      def text=(input)
        raise ElementNotEnabled unless enabled?
        @automation_element.get_current_pattern(System::Windows::Automation::ValuePattern.pattern).set_value(input)
      end
    end
  end
end
