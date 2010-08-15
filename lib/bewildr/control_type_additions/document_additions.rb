#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DocumentAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::TextPattern

        base.instance_eval do

          #TODO: make this deal with other special chars
          def clean_string(input)
            input.gsub(/\n/, "{ENTER}")
          end

          def text
            get_text
          end

          def text=(input)
            cleaned_string = clean_string(input)
            focus
            select_all
            System::Windows::Forms::SendKeys.send_wait("{DEL}")
            System::Windows::Forms::SendKeys.send_wait(cleaned_string)
          end
        end
      end
    end
  end
end
