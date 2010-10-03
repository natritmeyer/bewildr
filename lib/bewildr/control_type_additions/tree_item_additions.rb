#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TreeItemAdditions
      def self.extended(base)
        base.instance_eval do
          def child_nodes
            get(:type => :tree_item, :scope => :children)
          end

          #horrible, but necessary - clickable point for tree items doesn't work like you think it would...
          #I've added 7 to y and 22 to x... that's working for now... this is hardly the ideal solution...
          #To see what's going on with the following code, take a look at a tree node under uispy - you'll
          #understand - a picture paints a thousand words and all that.
          def clickable_point
            existence_check
            ae_top_left_point = @automation_element.current.bounding_rectangle.top_left
            ae_top_left_point.x += 22
            ae_top_left_point.y += 7
            ae_top_left_point
          end
        end
      end
    end
  end
end
