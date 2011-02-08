#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module ExpandCollapsePattern
      #Expands the element - use to open combo boxes
      def expand
        @automation_element.get_current_pattern(System::Windows::Automation::ExpandCollapsePattern.pattern).expand unless expand_state == :expanded or expand_state == :leaf
      end

      #Collapses the element - use to close combo boxes
      def collapse
        @automation_element.get_current_pattern(System::Windows::Automation::ExpandCollapsePattern.pattern).collapse unless expand_state == :collapsed or expand_state == :leaf
      end

      #Returns the expand-state of the element. The available states are:
      #  :collapsed
      #  :expanded
      #  :partially_expanded
      #  :leaf
      def expand_state
        case @automation_element.get_current_pattern(System::Windows::Automation::ExpandCollapsePattern.pattern).current.expand_collapse_state
        when System::Windows::Automation::ExpandCollapseState.collapsed           then return :collapsed
        when System::Windows::Automation::ExpandCollapseState.expanded            then return :expanded
        when System::Windows::Automation::ExpandCollapseState.partially_expanded  then return :partially_expanded
        when System::Windows::Automation::ExpandCollapseState.leaf_node           then return :leaf
        end
      end
    end
  end
end