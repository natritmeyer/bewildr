#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DataGridAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::GridPattern
        base.extend Bewildr::ControlPatterns::TablePattern

        base.instance_eval do
          def cell(row, column)
            get_item(row, column)
          end
        end
      end
    end
  end
end
