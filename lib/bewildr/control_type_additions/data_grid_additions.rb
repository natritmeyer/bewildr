#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DataGridAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::GridPattern
        base.extend Bewildr::ControlPatterns::TablePattern

        base.instance_eval do

        end
      end
    end
  end
end
