#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module MenuItemAdditions
      def self.extended(base)
        base.instance_eval do
          def sub_menus
            get(:type => :menu_item, :scope => :children, :how_many => :all)
          end
		  
          def click
            @automation_element.get_current_pattern(System::Windows::Automation::InvokePattern.pattern).invoke
		  end
        end
      end
    end
  end
end
