#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.s

module Bewildr
  module ControlPatterns
    module TextPattern
      def select_all
        @automation_element.get_current_pattern(System::Windows::Automation::TextPattern.pattern).document_range.select
      end

      def get_text
        @automation_element.get_current_pattern(System::Windows::Automation::TextPattern.pattern).document_range.get_text(-1).to_s
      end
    end
  end
end
