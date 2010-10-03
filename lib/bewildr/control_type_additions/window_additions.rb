#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module WindowAdditions
      def self.extended(base)
        base.instance_eval do
          def open?
            exists?
          end

          def wait_for_close
            Timeout::timeout(30) do
              sleep 0.2 while open?
            end
          end
        end
      end
    end
  end
end
