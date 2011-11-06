#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

#the following taken from: http://www.natontesting.com/2010/06/30/how-to-get-the-submodules-of-a-ruby-module/

#adds the submodules method to modules - returns a list of submodules in the module's namespace
class Module #:nodoc: all
  def submodules
    constants.collect {|const_name| const_get(const_name)}.select {|const| const.class == Module}
  end
end

#removes need for active support
class String #:nodoc: all
  #directly stolen from active support - takes the module bit off a class name
  def bewildr_demodulize
    gsub(/^.*::/, '')
  end
  
  #Kinda like classify from active support, but does only what's needed by bewildr
  def bewildr_classify
    self.split("_").collect {|word| "#{word[0].upcase}#{word[1..-1]}"}.join
  end
end