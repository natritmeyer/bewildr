#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module ComboBoxAdditions
      #Returns a string array containing the element's item names
      def items
        list_items.collect {|item| item.name}
      end

      #Returns an array containing the combobox items
      def list_items
        begin
          expand_combo
          get(:type => :list_item, :scope => :children, :how_many => :all)
        ensure
          collapse_combo
        end
      end

      #Returns the number of items in the combobox
      def count
        items.size
      end

      #Selects a combobox item. Takes a string (and selects the first item whose name matches) or an integer and selects the respective element
      def select(input)
        case input
        when String then select_by_name(input)
        when Integer then select_by_index(input)
        else raise ArgumentError, "Select by name or by index"
        end
      end

      #Selects the first item whose name matches the input
      def select_by_name(input)
        begin
          expand_combo
          my_item = list_items.find {|item| item.name == input}
          raise Bewildr::NoSuchItemInComboBox if my_item.nil?
          my_item.select
        ensure
          collapse_combo
        end
      end

      #Selects the item at the supplied position
      def select_by_index(input)
        raise "Index must be 0 or greater" if input < 0
        begin
          expand_combo
          list_items[input].select
        ensure
          collapse_combo
        end
      end

      #Returns the selected combobox item
      def selected
        #TODO: find a way to not need to expand and collapse before getting the selected item
        expand_combo
        collapse_combo
        #get_selection.first
        get_selection.first.name
      end

      #Expands the combobox
      def expand_combo
        expand
        Timeout.timeout(30) do
          sleep 0.2 until expand_state == :expanded
        end
      end

      #Collapses the combobox
      def collapse_combo
        collapse
        Timeout.timeout(30) do
          sleep 0.2 until expand_state == :collapsed
        end
      end
    end
  end
end