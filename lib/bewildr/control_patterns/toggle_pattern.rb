#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module TogglePattern

      def self.extended(base)
        base.instance_eval do
          case @control_type
          when :check_box
            def check
              set_state_to :on
            end

            def uncheck
              set_state_to :off
            end

            def checked?
              state == :on
            end

            def unchecked?
              state == :off
            end

            def checked_state
              state
            end
          when :button
            def toggle(value)
              set_state_to(value)
            end

            def toggle_state
              state
            end

            def toggle
              flip_state
            end
          end
        end
      end

      private

      def set_state_to(value)
        raise ElementNotEnabled unless enabled?
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
