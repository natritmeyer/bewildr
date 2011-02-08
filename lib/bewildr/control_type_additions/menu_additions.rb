#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module MenuAdditions
      #Returns an array containing the menu's root items
      def root_menu_items
        get(:type => :menu_item, :scope => :children, :how_many => :all)
      end

      #Returns a string array containing the root items' names
      def root_menu_item_names
        root_menu_items.collect {|menu_item| menu_item.name}
      end

      #Clicks the menu described by the input, eg:
      #  select_menu(["File", "Close"])
      def select_menu(path)
        menu_item(path).click
      end

      #Selects the menu described by the input, eg:
      #  select_node(["File", "Close"])
      def select_node(path)
        node(path).select
      end

      #Returns the menu item described by the input, eg:
      #  menu_item(["File", "Close"])
      def menu_item(path)
        current_menu_items = root_menu_items
        matching_menu_item = nil
        path.each_with_index do |target_menu_item, index|
          case current_menu_items
          when Array
            matching_menu_item = current_menu_items.find {|node| node.name == target_menu_item} #TODO: make this work with regexes as well as strings...
            raise Bewildr::ElementDoesntExist if matching_menu_item.nil?
          when Bewildr::Element
            if current_menu_items.name == target_menu_item #TODO: make this work with regexes as well as strings...
              matching_menu_item = current_menu_items
            else
              raise Bewildr::ElementDoesntExist
            end
          end
          raise Bewildr::ElementDoesntExist if matching_menu_item.nil?
          if path.size != index + 1
            matching_menu_item.expand
            current_menu_items = matching_menu_item.sub_menus
          end
        end
        return matching_menu_item
      end

      #Returns true if the menu contains the item described by the input, false if it doesn't
      def contains_menu_item?(path)
        begin
          menu_item(path)
          return true
        rescue ElementDoesntExist => e
          return false
        end
      end
    end
  end
end
