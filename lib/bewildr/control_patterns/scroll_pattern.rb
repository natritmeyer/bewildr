#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module ScrollPattern
      def self.extended(base)
        
        base.instance_eval do
          def vertically_scrollable
            @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).current.vertically_scrollable
          end

          def vertical_scroll_percent
            @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).current.vertical_scroll_percent.to_f
          end
          alias :scroll_percent :vertical_scroll_percent

          def set_scroll_percent(percent_horizontal, percent_vertical)
            @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).set_scroll_percent(percent_horizontal, percent_vertical)
          end
      
          def scroll_vertically_to(target_percentage)
            set_scroll_percent(System::Windows::Automation::ScrollPattern.NoScroll, target_percentage)
          end
          alias :scroll_to :scroll_vertically_to

          def scroll_horizontally_to(target_percentage)
            set_scroll_percent(target_percentage, System::Windows::Automation::ScrollPattern.NoScroll)
          end

          def scroll_down_one_page
            @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).scroll_vertical(System::Windows::Automation::ScrollAmount.LargeIncrement)
          end
        end
      end
    end
  end
end
