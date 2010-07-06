require 'rubygems'
require 'test/unit'
require 'bewildr'

class BewildrTest < Test::Unit::TestCase
  def setup
    #make sure that the test app is not running - we want a clean slate
    Bewildr::Application.kill_all_processes_with_name("BewildrTestApp")

    #start the app and wait for the main window
    @app, @main_window = Bewildr::Application.start_app_and_wait_for_window("./features/support/BewildrTestApp.exe", /Bewildr/)
  end

  def test_button_click
    #select the 'basic' tab
    @main_window.get(:id => "main_tabs").select("basic")

    #click the button with automation id: 'enabled_button'
    @main_window.get(:id => "enabled_button").click

    #check to see if the button click worked
    assert @main_window.get(:id => "enabled_button_message").text == "clicked!"
  end

  def test_slider_move
    #select the 'bars' tab
    @main_window.get(:id => "main_tabs").select("bars")

    #move the slider
    @main_window.get(:id => "slider1").value = 7

    #check to see if the slider moved
    assert @main_window.get(:id => "slider1").value == 7
  end
end
