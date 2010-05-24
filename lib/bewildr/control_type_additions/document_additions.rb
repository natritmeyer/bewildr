#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DocumentAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::TextPattern

        base.instance_eval do
          def text
            get_text
          end

          def text=(input)
            focus
            select_all
            System::Windows::Forms::SendKeys.send_wait("{DEL}")
            System::Windows::Forms::SendKeys.send_wait(input)
          end
        end
      end
    end
  end
end
