#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions #:nodoc:
    module TextAdditions
      #Returns the element's text
      def text
        existence_check
        name
      end
    end
  end
end
