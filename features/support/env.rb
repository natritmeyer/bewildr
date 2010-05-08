require 'rubygems'
require 'spec'

$: << "./lib"
require 'bewildr'

#kill the test app if it's already open
Bewildr::Application.kill_all_processes_with_name("BewildrTestApp")