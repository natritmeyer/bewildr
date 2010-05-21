#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TabAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::SelectionPattern

        base.instance_eval do
          def select(input)
            selectable_elements = get(:type => :tab_item, :scope => :children)
            selectable_elements.find {|selectable_element| selectable_element.name == input}.select
          end

          def tabs
            get(:type => :tab_item, :scope => :children)
          end

          def tab_names
            tabs.collect {|tab| tab.name}
          end
        end
      end
    end
  end
end
