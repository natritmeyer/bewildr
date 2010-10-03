#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DataGridAdditions
      def self.extended(base)
        base.instance_eval do
          def cell(row, column)
            get_item(row, column)
          end
        end
      end
    end
  end
end
