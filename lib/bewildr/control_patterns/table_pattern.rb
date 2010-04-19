#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module TablePattern
      def column_headers
        @automation_element.get_current_pattern(System::Windows::Automation::TablePattern.pattern).current.get_column_headers.collect do |header|
          Bewildr::Element.new(header)
        end
      end

      def column_header_names
        column_headers.collect {|header| header.name }
      end
    end
  end
end
