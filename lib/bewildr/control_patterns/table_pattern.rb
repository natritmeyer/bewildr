#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns #:nodoc:
    module TablePattern
      #Returns an array of elements containing the column headers
      def column_headers
        #the following line seems to prompt the table pattern into giving up the column header
        #information that's called on the line that follows it. Weird? tell me about it...
        @automation_element.get_current_pattern(System::Windows::Automation::TablePattern.pattern).current.get_row_headers
        @automation_element.get_current_pattern(System::Windows::Automation::TablePattern.pattern).current.get_column_headers.collect do |header|
          Bewildr::Element.new(header)
        end
      end

      #Returns a string array containing the column header names
      def column_header_names
        column_headers.collect {|header| header.name }
      end
    end
  end
end
