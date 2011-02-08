#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlPatterns
    module ScrollPattern
      #Returns true if the element is vertically scrollable, false if it's not
      def vertically_scrollable
        @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).current.vertically_scrollable
      end

      #Returns the current vertical scroll percent
      def vertical_scroll_percent
        @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).current.vertical_scroll_percent.to_f
      end
      alias :scroll_percent :vertical_scroll_percent

      #Set the scroll percent of the element
      def set_scroll_percent(percent_horizontal, percent_vertical)
        @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).set_scroll_percent(percent_horizontal, percent_vertical)
      end

      #Set the vertical scroll percent of the element
      def scroll_vertically_to(target_percentage)
        set_scroll_percent(System::Windows::Automation::ScrollPattern.NoScroll, target_percentage)
      end
      alias :scroll_to :scroll_vertically_to

      #Set the horizontal scroll percent of the element
      def scroll_horizontally_to(target_percentage)
        set_scroll_percent(target_percentage, System::Windows::Automation::ScrollPattern.NoScroll)
      end

      #Scrolls vertically down by one 'page'
      def scroll_down_one_page
        @automation_element.get_current_pattern(System::Windows::Automation::ScrollPattern.pattern).scroll_vertical(System::Windows::Automation::ScrollAmount.LargeIncrement)
      end
    end
  end
end
