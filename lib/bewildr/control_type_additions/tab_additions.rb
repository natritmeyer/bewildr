#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TabAdditions
      #Selects the tab whose name matches the input
      def select(input)
        raise Bewildr::NoSuchTab unless tab_names.include?(input)
        selectable_elements = tabs
        selectable_elements.find {|selectable_element| selectable_element.name == input}.select
      end

      #Returns an array containing the tab items belonging to the tab control
      def tabs
        get(:type => :tab_item, :scope => :children, :how_many => :all)
      end

      #Returns a string array containing the names of all the tabs in the tab control
      def tab_names
        tabs.collect {|tab| tab.name}
      end

      #Returns the selected tab
      def selected
        tabs.find {|tab| tab.selected?}
      end
    end
  end
end
