#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions #:nodoc:
    module DocumentAdditions
      #Returns the document text
      def text
        get_text
      end

      #Sets the document text to the supplied input
      def text=(input)
        cleaned_string = clean_string(input)
        focus
        select_all
        System::Windows::Forms::SendKeys.send_wait("{DEL}")
        System::Windows::Forms::SendKeys.send_wait(cleaned_string)
      end

      private

      def clean_string(input)
        #add special chars as necessary. Ref: http://msdn.microsoft.com/en-us/library/system.windows.forms.sendkeys.send.aspx
        replacements = {
          /\n/ => "{ENTER}"
        }
        cleaned_string = input
        replacements.keys.each {|key| cleaned_string.gsub!(key, replacements[key])}
        cleaned_string
      end
    end
  end
end
