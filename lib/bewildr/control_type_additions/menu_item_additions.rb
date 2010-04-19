#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module MenuItemAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::ExpandCollapsePattern
        base.extend Bewildr::ControlPatterns::InvokePattern

        base.instance_eval do
          def sub_menus
            get(:type => :menu_item, :scope => :children)
          end
        end
      end
    end
  end
end
