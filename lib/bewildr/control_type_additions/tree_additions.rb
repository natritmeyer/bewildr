#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions #:nodoc:
    module TreeAdditions
      #Returns an array containing the tree's root nodes
      def root_nodes
        prepare_element
        get(:type => :tree_item, :scope => :children)
      end

      #Returns the root node
      def root_node
        root_nodes.first
      end

      #Selects the tree node described by the input, eg:
      #  select_node(["parent node", "child node"])
      def select_node(path)
        node(path).select
      end

      #Returns the tree node described by the input, eg:
      #  node(["parent node", "child node"])
      def node(path)
        current_nodes = root_nodes
        matching_node = nil
        path.each_with_index do |target_node, index|
          case current_nodes
          when Array
            matching_node = current_nodes.find {|node| node.name == target_node} #TODO: make this work with regexes as well as strings...
            raise Bewildr::ElementDoesntExist if matching_node.nil?
          when Bewildr::Element
            if current_nodes.name == target_node #TODO: make this work with regexes as well as strings...
              matching_node = current_nodes
            else
              raise Bewildr::ElementDoesntExist
            end
          end
          raise Bewildr::ElementDoesntExist if matching_node.nil?
          if path.size != index + 1
            matching_node.expand
            load_all_items_hack
            current_nodes = matching_node.child_nodes
          end
        end
        return matching_node
      end

      #Returns true if the tree contains the item described by the input, false if it doesn't
      def contains_node?(path)
        begin
          node(path)
          return true
        rescue ElementDoesntExist => e
          return false
        end
      end
    end
  end
end
