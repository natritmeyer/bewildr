#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TextAdditions
      def self.extended(base)
        base.instance_eval do
          def text
            existence_check
            name
          end
        end
      end
    end
  end
end
