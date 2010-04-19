#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TreeItemAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::ExpandCollapsePattern
        base.extend Bewildr::ControlPatterns::SelectionItemPattern

        base.instance_eval do
          def child_nodes
            get(:type => :tree_item, :scope => :children)
          end
        end
      end
    end
  end
end
