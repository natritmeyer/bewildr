#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

#the following taken from: http://www.natontesting.com/2010/06/30/how-to-get-the-submodules-of-a-ruby-module/

#adds the submodules method to modules - returns a list of submodules in the module's namespace
class Module
  def submodules
    modules = []
    self.constants.each do |const|
      temp_const = self.const_get(const)
      modules << temp_const if temp_const.class == Module
    end
    modules
  end
end
