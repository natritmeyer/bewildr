#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

#the following taken from: http://www.natontesting.com/2010/06/30/how-to-get-the-submodules-of-a-ruby-module/

#adds the submodules method to modules - returns a list of submodules in the module's namespace
class Module
  def submodules
    constants.collect {|const_name| const_get(const_name)}.select {|const| const.class == Module}
  end
end
