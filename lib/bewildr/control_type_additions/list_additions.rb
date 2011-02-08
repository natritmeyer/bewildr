#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module ListAdditions
      #Select the list item whose name matches the supplied input
      def select(input)
        selectable_elements = get(:type => :list_item, :scope => :children, :how_many => :all)
        selectable_elements.find {|selectable_element| selectable_element.name == input}.select
      end

      #Returns a string array containing the list item names
      def items
        my_list_items = list_items
        return nil if my_list_items.nil?
        my_list_items.collect {|item| item.name}
      end

      #Returns an array containing the list items
      def list_items
        prepare_element
        bewildr_list_items = get(:type => :list_item, :scope => :children, :how_many => :all)
        bewildr_list_items.nil? ? nil : bewildr_list_items
      end

      #Returns the number of items in the list
      def count
        my_items = items
        my_items.nil? ? 0 : my_items.size
      end

      #Selects a list item. Takes a string (and selects the first item whose name matches) or an integer and selects the respective element
      def select(input)
        case input
        when String then select_by_name(input)
        when Integer then select_by_index(input)
        else raise ArgumentError, "Select by name or by index"
        end
      end

      #Selects the first item whose name matches the input
      def select_by_name(input)
        my_item = list_items.find {|item| item.name == input}
        raise Bewildr::NoSuchItemInListBox if my_item.nil?
        my_item.select
      end

      #Selects the item at the supplied position
      def select_by_index(input)
        raise "Index must be 0 or greater" if input < 0
        list_items[input].select
      end

      #Returns the selected list item
      def selected
        return nil if get_selection.empty?
        get_selection.first.name
      end
    end
  end
end
