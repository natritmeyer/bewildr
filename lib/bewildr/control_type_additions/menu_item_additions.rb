#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions #:nodoc:
    module MenuItemAdditions
      def sub_menus
        get(:type => :menu_item, :scope => :children, :how_many => :all)
      end

      #menu items like 'invoke', not a proper mouse click
      def click
        @automation_element.get_current_pattern(System::Windows::Automation::InvokePattern.pattern).invoke
      end
    end
  end
end
