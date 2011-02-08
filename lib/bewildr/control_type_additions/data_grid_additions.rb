#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DataGridAdditions
      def cell(row, column)
        get_item(row, column)
      end
    end
  end
end
