#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  class Application
    def initialize(proc)
      @proc = proc
      @proc.wait_for_input_idle(10)
      @proc_id = proc.id
    end
    private :initialize

    def kill
      `taskkill /f /t /pid #{@proc_id}`
      Timeout::timeout(5) do
        sleep 0.1 while running?
      end
    end

    def running?
      @proc.nil? ? false : !@proc.has_exited
    end

    def wait_for_termination
      Timeout::timeout(30) do
        sleep 0.2 while running?
      end
    end

    def windows
      Bewildr::Windows.windows_by_process_id(@proc_id)
    end

    def window_by_name(input)
      case input
      when String then return windows.select{|window| window.name.strip == input.strip}.first
      when Regexp then return windows.select{|window| input.match(window.name.strip).nil? == false}.first
      else
        raise ArgumentError, "input not a string or regexp but a #{input.class}"
      end
    end
    alias :window :window_by_name

    def wait_for_window(input, wait_time = 30)
      begin
        Timeout::timeout(wait_time) do
          begin
            my_window = window(input)
            raise if my_window.nil?
            return my_window
          rescue
            sleep 0.2
            retry
          end
        end
      rescue Timeout::Error
        raise Bewildr::ElementDoesntExist
      end
    end

    #takes name or full path of exe to start
    def self.start(process_name)
      raise "Can't find: #{process_name}" unless File.exist?(process_name)
      Bewildr::Application.new(System::Diagnostics::Process.start(process_name))
    end

    def self.start_with_settings(settings_hash)
      #TODO
    end

    def self.attach_to_process_name(process_name)
      Bewildr::Application.new(System::Diagnostics::Process.get_processes_by_name(process_name).first)
    end

    def self.attach_to_process(process)
      Bewildr::Application.new(process)
    end

    def self.attach_or_launch(path_to_exe)
      #if app is already open attach to it
      potential_process_name = File.basename(path_to_exe, ".exe")
      if Bewildr::Application.processes_with_name(potential_process_name).size > 0
        #app is running, attach to it
        Bewildr::Application.attach_to_process_name(potential_process_name)
      else
        #app is not running, start a new instance
        Bewildr::Application.start(path_to_exe)
      end
    end

    def self.start_app_and_wait_for_window(path, window_name)
      app = Bewildr::Application.start(path)
      window = app.wait_for_window(window_name)
      return app, window
    end

    def self.kill_all_processes_with_name(input)
      System::Diagnostics::Process.get_processes_by_name(input).each do |p|
        p.kill
        p.wait_for_exit
      end
    end

    def self.processes_with_name(input)
      System::Diagnostics::Process.get_processes_by_name(input).collect {|p| Bewildr::Application.attach_to_process(p) }
    end

    def self.wait_for_process_with_name(input)
      Timeout.timeout(30) {sleep 0.1 until System::Diagnostics::Process.get_processes_by_name(input).size > 0}
      self.attach_to_process_name(input)
    end
  end
end
