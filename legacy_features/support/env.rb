require 'rubygems'
require 'spec'

$: << "./lib"
require 'bewildr'

Before do
  Bewildr::Application.kill_all_processes_with_name("WindowsPresentationFramework")
end

