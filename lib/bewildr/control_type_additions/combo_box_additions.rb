#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module ComboBoxAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::ExpandCollapsePattern
        base.extend Bewildr::ControlPatterns::SelectionPattern
        base.extend Bewildr::ControlPatterns::SelectionItemPattern

        base.instance_eval do
          def items
            my_list_items = list_items
            return nil if my_list_items.nil?
            my_list_items.collect {|item| item.name}
          end

          def list_items
            begin
              expand_combo
              bewildr_list_items = get(:type => :list_item, :scope => :children)
              bewildr_list_items.nil? ? nil : bewildr_list_items
            ensure
              collapse_combo
            end
          end

          def count
            my_items = items
            my_items.nil? ? 0 : my_items.size
          end

          def select(input)
            case input
            when String then select_by_name(input)
            when Integer then select_by_index(input)
            else raise ArgumentError, "Select by name or by index"
            end
          end

          def select_by_name(input)
            begin
              expand_combo
              my_item = list_items.find {|item| item.name == input}
              raise NoSuchItemInComboBox if my_item.nil?
              my_item.select
            ensure
              collapse_combo
            end
          end

          def select_by_index(input)
            raise "Index must be 0 or greater" if input < 0
            begin
              expand_combo
              my_item = list_items[input].select
            ensure
              collapse_combo
            end
          end

          def selected
            #TODO: find a way to not need to expand and collapse before getting the selected item
            expand_combo
            collapse_combo
            #get_selection.first
            get_selection.first.name
          end

          def expand_combo
            expand
            Timeout.timeout(30) do
              sleep 0.2 until expand_state == :expanded
            end
          end

          def collapse_combo
            collapse
            Timeout.timeout(30) do
              sleep 0.2 until expand_state == :collapsed
            end
          end
        end
      end
    end
  end
end