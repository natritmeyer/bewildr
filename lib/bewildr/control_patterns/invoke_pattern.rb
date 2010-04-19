#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module InvokePattern
      def click
         @automation_element.get_current_pattern(System::Windows::Automation::InvokePattern.pattern).invoke
      end
    end
  end
end