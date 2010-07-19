#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module ControlTypeAdditions
    module ScrollAdditions
      def self.extended(base)
        base.extend Bewildr::ControlPatterns::ScrollPattern

        base.instance_eval do
          
          #required because when a list is displayed, UI Automation only knows
          #about the visible items. This method stores where the scroll value is,
          #then moves the scroller to the top of the scroll bar and proceeds to
          #page-down until the bottom of the scroll bar is reached. At this point,
          #UI Automation knows about all the items in the list and we can put
          #the scroll back where it was before we started this nonsense.
          def load_all_items_hack
            return unless scrollable?

            initial_scroll_value = vertical_scroll_percent

            scroll_to 0.0
            page_down_to_bottom_of_scroll_bar
            scroll_to initial_scroll_value
          end

          def page_down_to_bottom_of_scroll_bar
            scroll_down_one_page while vertical_scroll_percent < 100.0
          end
        end
      end
    end
  end
end
