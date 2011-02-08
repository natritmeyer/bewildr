#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module TreeAdditions
      def root_nodes
        prepare_element
        get(:type => :tree_item, :scope => :children)
      end

      def root_node
        root_nodes.first
      end

      def select_node(path)
        node(path).select
      end

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
            current_nodes = matching_node.child_nodes
          end
        end
        return matching_node
      end

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
