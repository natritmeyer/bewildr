#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TextAdditions
      def text
        existence_check
        name
      end
    end
  end
end
