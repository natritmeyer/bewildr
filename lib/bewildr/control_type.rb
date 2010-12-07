#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  class ControlType
    class << self
      def symbol_for_enum(input_control_type_enum)
        raise "Unknown control type: #{input_control_type_enum}" unless @@control_type_map.value?(input_control_type_enum)
        @@control_type_map.index(input_control_type_enum)
      end

      def enum_for_symbol(input_symbol)
        raise "Unknown control type: #{input_symbol}" unless @@control_type_map.key?(input_symbol)
        @@control_type_map[input_symbol]
      end
    end

    @@control_type_map = {
      :button =>          System::Windows::Automation::ControlType.Button,
      :calendar =>        System::Windows::Automation::ControlType.Calendar,
      :check_box =>       System::Windows::Automation::ControlType.CheckBox,
      :combo_box =>       System::Windows::Automation::ControlType.ComboBox,
      :custom =>          System::Windows::Automation::ControlType.Custom,
      :data_grid =>       System::Windows::Automation::ControlType.DataGrid,
      :data_item =>       System::Windows::Automation::ControlType.DataItem,
      :document =>        System::Windows::Automation::ControlType.Document,
      :edit =>            System::Windows::Automation::ControlType.Edit,
      :group =>           System::Windows::Automation::ControlType.Group,
      :header =>          System::Windows::Automation::ControlType.Header,
      :header_item =>     System::Windows::Automation::ControlType.HeaderItem,
      :hyperlink =>       System::Windows::Automation::ControlType.Hyperlink,
      :image =>           System::Windows::Automation::ControlType.Image,
      :list =>            System::Windows::Automation::ControlType.List,
      :list_item =>       System::Windows::Automation::ControlType.ListItem,
      :menu =>            System::Windows::Automation::ControlType.Menu,
      :menu_bar =>        System::Windows::Automation::ControlType.MenuBar,
      :menu_item =>       System::Windows::Automation::ControlType.MenuItem,
      :pane =>            System::Windows::Automation::ControlType.Pane,
      :progress_bar =>    System::Windows::Automation::ControlType.ProgressBar,
      :radio_button =>    System::Windows::Automation::ControlType.RadioButton,
      :scroll_bar =>      System::Windows::Automation::ControlType.ScrollBar,
      :seperator =>       System::Windows::Automation::ControlType.Separator,
      :slider =>          System::Windows::Automation::ControlType.Slider,
      :spinner =>         System::Windows::Automation::ControlType.Spinner,
      :split_button =>    System::Windows::Automation::ControlType.SplitButton,
      :status_bar =>      System::Windows::Automation::ControlType.StatusBar,
      :tab =>             System::Windows::Automation::ControlType.Tab,
      :tab_item =>        System::Windows::Automation::ControlType.TabItem,
      :table =>           System::Windows::Automation::ControlType.Table,
      :text =>            System::Windows::Automation::ControlType.Text,
      :thumb =>           System::Windows::Automation::ControlType.Thumb,
      :title_bar =>       System::Windows::Automation::ControlType.TitleBar,
      :tool_bar =>        System::Windows::Automation::ControlType.ToolBar,
      :tool_tip =>        System::Windows::Automation::ControlType.ToolTip,
      :tree =>            System::Windows::Automation::ControlType.Tree,
      :tree_item =>       System::Windows::Automation::ControlType.TreeItem,
      :window =>          System::Windows::Automation::ControlType.Window
    }
  end
end
