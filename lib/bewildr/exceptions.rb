#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  class ElementNotEnabled < StandardError; end
  class ElementDoesntExist < StandardError; end
  class PasswordFieldReadAttempt < StandardError; end
  class NoSuchItemInComboBox < StandardError; end
  class NoSuchItemInListBox < StandardError; end
  class NoSuchTab < StandardError; end
  class InternalError < StandardError; end
end