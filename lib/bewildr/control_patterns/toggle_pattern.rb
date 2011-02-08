#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module TogglePatternForButton
      #Toggle on the element
      def toggle_on
        set_state_to(:on)
      end

      #Toggle off the element
      def toggle_off
        set_state_to(:off)
      end

      #Return the toggle state. The available states are:
      #  :on
      #  :off
      #  :indeterminate
      def toggle_state
        state
      end

      #Toggle the element
      def toggle
        flip_state
      end
    end

    module TogglePatternForCheckBox
      #Check the element
      def check
        set_state_to :on
      end

      #Uncheck the element
      def uncheck
        set_state_to :off
      end

      #Return true if the element is checked, false if it's not
      def checked?
        state == :on
      end

      #Return true if the element is unchecked, false if it's not
      def unchecked?
        state == :off
      end

      #Return true if the element is indeterminate, false if it's not
      def indeterminate?
        state == :indeterminate
      end

      #Returns the checked state. The available states are:
      #  :on
      #  :off
      #  :indeterminate
      def checked_state
        state
      end
    end

    #These are not the toggle patterns you are looking for [wave of the hand/]. If you are dealing with a button, look for Bewildr::ControlPatterns::TogglePatternForButton.
    #If you're dealing with a checkbox, take a look at Bewildr::ControlPatterns::TogglePatternForCheckBox
    module TogglePattern
      def self.extended(base)
        base.instance_eval do
          case @control_type
          when :check_box
            base.extend(Bewildr::ControlPatterns::TogglePatternForCheckBox)
          when :button
            base.extend(Bewildr::ControlPatterns::TogglePatternForButton)
          end
        end
      end

      private

      def set_state_to(value)
        raise Bewildr::ElementNotEnabled unless enabled?
        case value
        when :on  then flip_state while state != :on
        when :off then flip_state while state != :off
        else raise ArgumentError, "Didn't receive :on or :off"
        end
      end

      def state
        case @automation_element.get_current_pattern(System::Windows::Automation::TogglePattern.pattern).current.toggle_state
        when System::Windows::Automation::ToggleState.Off then return :off
        when System::Windows::Automation::ToggleState.On then return :on
        when System::Windows::Automation::ToggleState.Indeterminate then return :indeterminate
        end
      end

      def flip_state
        @automation_element.get_current_pattern(System::Windows::Automation::TogglePattern.pattern).toggle
      end
    end
  end
end
