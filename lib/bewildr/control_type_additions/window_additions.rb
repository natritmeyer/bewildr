#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions #:nodoc:
    module WindowAdditions
      #Returns true if the window is open, false if it's not
      def open?
        exists?
      end

      #Waits up to 30 seconds for the window to close
      def wait_for_close
        Timeout::timeout(30) do
          sleep 0.2 while open?
        end
      end
    end
  end
end
