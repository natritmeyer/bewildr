#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

class ElementNotEnabled < StandardError; end
class ElementDoesntExist < StandardError; end
class PasswordFieldReadAttempt < StandardError; end
class NoSuchItemInComboBox < StandardError; end
class NoSuchItemInListBox < StandardError; end

class BewildrInternalError < StandardError; end