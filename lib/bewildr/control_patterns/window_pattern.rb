#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module WindowPattern
      #Closes the window
      def close
        @automation_element.get_current_pattern(System::Windows::Automation::WindowPattern.pattern).close
      end

      #Minimizes the window
      def minimize
        @automation_element.get_current_pattern(System::Windows::Automation::WindowPattern.pattern).set_window_visual_state(System::Windows::Automation::WindowVisualState.minimized)
      end

      #Maximizes the window
      def maximize
        @automation_element.get_current_pattern(System::Windows::Automation::WindowPattern.pattern).set_window_visual_state(System::Windows::Automation::WindowVisualState.maximized)
      end

      #Restores the window
      def restore
        @automation_element.get_current_pattern(System::Windows::Automation::WindowPattern.pattern).set_window_visual_state(System::Windows::Automation::WindowVisualState.normal)
      end

      #Returns the visual state of the window. Available states are:
      #  :maximized
      #  :minimized
      #  :normal
      def visual_state
        case @automation_element.get_current_pattern(System::Windows::Automation::WindowPattern.pattern).current.window_visual_state
        when System::Windows::Automation::WindowVisualState.maximized then return :maximized
        when System::Windows::Automation::WindowVisualState.minimized then return :minimized
        when System::Windows::Automation::WindowVisualState.normal    then return :normal
        end
      end
    end
  end
end
