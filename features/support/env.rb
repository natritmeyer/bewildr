require 'rubygems'
require 'spec'

$: << "./lib"
require 'bewildr'

#kill the test app if the previous test failed
After do |scenario|
  Bewildr::Application.kill_all_processes_with_name("BewildrTestApp") if scenario.failed?
end

#kill the test app before the test run begins
Bewildr::Application.kill_all_processes_with_name("BewildrTestApp")
