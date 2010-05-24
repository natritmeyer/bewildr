#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DocumentAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::TextPattern

        base.instance_eval do

        end
      end
    end
  end
end
