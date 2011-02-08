#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  class Windows
    #Returns an array of windows belonging to a process id
    def self.windows_by_process_id(process_id)
      #find top level windows
      window_scope = System::Windows::Automation::TreeScope.Children
      process_id_property = System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.process_id_property, process_id.to_i)
      top_level_windows = System::Windows::Automation::AutomationElement.root_element.find_all(window_scope, process_id_property).to_a

      all_windows = []
      all_windows << top_level_windows

      #loop through the top level windows looking for child windows
      top_level_windows.each do |top_level_window|
        control_type_property = System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.control_type_property, System::Windows::Automation::ControlType.Window)
        all_windows << top_level_window.find_all(window_scope, control_type_property).to_a
      end
      
      all_windows.flatten.collect {|window| Bewildr::Element.new(window)}
    end
  end
end
