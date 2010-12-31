#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  #Wraps System::Diagnostics::Process object and provides class methods to interrogate currently running
  #processes, attach to processes or start new ones
  class Application
    #Returns a new instance of Bewildr::Application that wraps the process passed as the argument
    def initialize(proc)
      @proc = proc
      @proc.wait_for_input_idle(10)
    end
    private :initialize

    #Returns the id of the underlying process
    def proc_id
      running? ? @proc.id.to_i : nil
    end

    #Return the name of the underlying process
    def name
      running? ? @proc.process_name.to_s : nil
    end

    #kills this process. Uses taskkill to perform the butchery
    def kill
      `taskkill /f /t /pid #{proc_id}`
      Timeout::timeout(5) do
        sleep 0.1 while running?
      end
    end

    #Returns true if this process is running, false if it isn't
    def running?
      @proc.nil? ? false : !@proc.has_exited
    end

    #Waits for up to 30 seconds for the process to terminate
    def wait_for_termination
      Timeout::timeout(30) do
        sleep 0.2 while running?
      end
    end

    #Returns a list of windows associated with this application
    def windows
      Bewildr::Windows.windows_by_process_id(proc_id)
    end

    #Returns a window whose title matches the string or regex passed in as the argument
    def window_by_name(input)
      case input
      when String then return windows.select{|window| window.name.strip == input.strip}.first
      when Regexp then return windows.select{|window| input.match(window.name.strip).nil? == false}.first
      else
        raise ArgumentError, "input not a string or regexp but a #{input.class}"
      end
    end
    alias :window :window_by_name

    #Waits for up to 30 seconds for a window belonging to this application to appear. When it does, a
    #Bewildr::Element representing the window is returned. This method allows you in one line to wait
    #for a window to appear and also return it
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

    #Returns a new instance of Bewildr::Application wrapping the process created when the specified exe file is invoked.
    #  Application.start("notepad.exe")
    #  Application.start("c:\some\path\my_app.exe")
    def self.start(process_name)
      raise "Can't find: #{process_name}" unless File.exist?(process_name)
      Bewildr::Application.new(System::Diagnostics::Process.start(process_name))
    end

    #Same as the start method but allows the passing of arguments
    def self.start_with_settings(path_to_exe, settings_hash)
      start_info = System::Diagnostics::ProcessStartInfo.new(path_to_exe)
      unless settings_hash[:args].nil? and settings_hash[:args].size > 0
        start_info.arguments = settings_hash[:args].collect {|arg| arg.to_s}.join(" ")
      end
      Bewildr::Application.new(System::Diagnostics::Process.start(start_info))
    end

    #Returns a Bewildr::Application wrapping a process already in memory where the argument is the process name
    def self.attach_to_process_name(process_name)
      Bewildr::Application.new(System::Diagnostics::Process.get_processes_by_name(process_name).first)
    end

    #Returns a Bewildr::Application wrapping a process already in memory where the argument is the process object to be wrapped
    def self.attach_to_process(process)
      Bewildr::Application.new(process)
    end

    #Given an exe name/path this method will return a new Bewildr::Application based either on a process already in memory
    #or the process started by executing the app at the path specified in the argument
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

    #Starts the app specified in the first argument and then waits and returns the window that matches the
    #string or regex passed as the second argument
    def self.start_app_and_wait_for_window(path, window_name)
      app = Bewildr::Application.start(path)
      window = app.wait_for_window(window_name)
      return app, window
    end

    #Kills all processes that match the name passed as an argument
    def self.kill_all_processes_with_name(input)
      System::Diagnostics::Process.get_processes_by_name(input).each do |p|
        p.kill
        p.wait_for_exit
      end
    end

    #Returns an array of Bewildr::Application instances wrapping processes whose name match the string
    #passed as an argument
    def self.processes_with_name(input)
      System::Diagnostics::Process.get_processes_by_name(input).collect {|p| Bewildr::Application.attach_to_process(p) }
    end

    #Waits for and eventually returns a Bewildr::Application wrapping the process whose name matches
    #the string passed as an argument
    def self.wait_for_process_with_name(input)
      Timeout.timeout(30) {sleep 0.1 until System::Diagnostics::Process.get_processes_by_name(input).size > 0}
      self.attach_to_process_name(input)
    end
  end
end
