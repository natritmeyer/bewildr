#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

#don't load bewildr unless we're using ironruby
#get rid of the following line and make sure that the gemspec sets it to be
#iron ruby only: http://www.ironruby.net/documentation/real_ruby_applications/rubygems

raise LoadError, "Bewildr only works under IronRuby" unless RUBY_ENGINE == "ironruby"

#require the UI Automation dlls
load_assembly 'UIAutomationClient, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'
load_assembly 'UIAutomationTypes, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'
load_assembly 'System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'
load_assembly 'System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'
load_assembly 'WindowsBase, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'

#require BewildrClickr - stopgap until the ffi gem works under ironruby
require File.join(File.expand_path(File.dirname(__FILE__)), "bewildr", "ext", "BewildrClickr.dll")
CLICKR = Bewildr::Clickr::Clickr.new

#load plain old ruby libraries
require 'timeout'
require 'singleton'
require 'active_support/core_ext/string/inflections'

#require ruby extensions
require 'bewildr/ext/extensions'

#require bewildr classes
require 'bewildr/exceptions'
require 'bewildr/bewildr_helpers'
require 'bewildr/control_type'
require 'bewildr/finder'
require 'bewildr/application'
require 'bewildr/windows'
require 'bewildr/element'
require 'bewildr/mouse'

require 'bewildr/control_patterns/window_pattern'
require 'bewildr/control_patterns/value_pattern'
require 'bewildr/control_patterns/toggle_pattern'
require 'bewildr/control_patterns/selection_pattern'
require 'bewildr/control_patterns/expand_collapse_pattern'
require 'bewildr/control_patterns/selection_item_pattern'
require 'bewildr/control_patterns/range_value_pattern'
require 'bewildr/control_patterns/grid_pattern'
require 'bewildr/control_patterns/table_pattern'
require 'bewildr/control_patterns/text_pattern'
require 'bewildr/control_patterns/table_item_pattern'
require 'bewildr/control_patterns/scroll_pattern'

require 'bewildr/control_type_additions/text_additions'
require 'bewildr/control_type_additions/combo_box_additions'
require 'bewildr/control_type_additions/window_additions'
require 'bewildr/control_type_additions/menu_additions'
require 'bewildr/control_type_additions/menu_item_additions'
require 'bewildr/control_type_additions/tab_additions'
require 'bewildr/control_type_additions/list_additions'
require 'bewildr/control_type_additions/tree_additions'
require 'bewildr/control_type_additions/tree_item_additions'
require 'bewildr/control_type_additions/data_grid_additions'
require 'bewildr/control_type_additions/document_additions'
require 'bewildr/control_type_additions/scroll_additions'
