#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DocumentAdditions
      def self.extended(base)
        base.instance_eval do

          def clean_string(input)
            #add special chars as necessary. Ref: http://msdn.microsoft.com/en-us/library/system.windows.forms.sendkeys.send.aspx
            replacements = {
              /\n/ => "{ENTER}"
            }
            cleaned_string = input
            replacements.keys.each {|key| cleaned_string.gsub!(key, replacements[key])}
            cleaned_string
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
