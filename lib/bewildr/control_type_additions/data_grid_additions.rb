#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module DataGridAdditions
      #Returns the cell at the supplied row and column
      def cell(row, column)
        get_item(row, column)
      end
    end
  end
end
