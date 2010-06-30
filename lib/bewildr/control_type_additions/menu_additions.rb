#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module MenuAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::ExpandCollapsePattern
        base.extend Bewildr::ControlPatterns::SelectionPattern
        base.extend Bewildr::ControlPatterns::SelectionItemPattern

        base.instance_eval do
          def root_menu_items
            get(:type =>:menu_item, :scope => :children)
          end

          def root_menu_item_names
            root_menu_items.collect {|menu_item| menu_item.name}
          end
          
          def select_menu(path)
             menu_item(path).click
          end

          def select_node(path)
            node(path).select
          end

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
  end
end
