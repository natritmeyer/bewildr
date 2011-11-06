#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  #Raised by a disabled element when a method is called on it assuming it is enabled
  class ElementNotEnabled < StandardError; end
  
  #Raised by an element marked as non existent when a method is called on it assuming it exists
  class ElementDoesntExist < StandardError; end
  
  #Raised by a password field element on an attempt to read its text value
  class PasswordFieldReadAttempt < StandardError; end
  
  #Raised by a combo box on trying to select an item that does not exist in its list of values
  class NoSuchItemInComboBox < StandardError; end
  
  #Raised by a list box on trying to select an item that does not exist in its list of values
  class NoSuchItemInListBox < StandardError; end
  
  #Raised by a tab group on trying to use a tab that does not exist
  class NoSuchTab < StandardError; end
  
  class InternalError < StandardError #:nodoc: all
  end
end