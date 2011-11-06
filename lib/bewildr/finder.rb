#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  #Wraps the Search Condition paradigm used by MS UI Automation to find objects in the UI Element tree. It contains various
  #methods that build up the parts needed for to search for elements. These methods are called by Bewildr::Element#get in
  #order to get and test for existence of descendent elements in the UI element tree. All of the methods take a condition
  #hash, this is made up of at least one, but can be several key/value pairs.
  class Finder #:nodoc: all
    extend Bewildr::BewildrHelpers
    
    class << self
      #Returns a System::Windows::Automation::PropertyCondition or AndCondition based on a translation of the condition hash.
      #The condition hash must contain at least one of the following keys:
      #  :id => "some id"
      #  :name => "some name"
      #  :type => :some_control_type
      #These keys can be combined to create more complex search criteria
      def condition_for(condition_hash)
        conditions = condition_hash.select {|key, value| [:id, :name, :type].include?(key) }
        conditions = Hash[*conditions.flatten] if conditions.instance_of?(Array) #if condition deals with ironruby's 1.8.6 emulation

        case
        when conditions.length == 0 then raise "Condition needs to include at least an :id, a :name or a :type"
        when conditions.length == 1 then return single_condition(conditions)
        when conditions.length > 1  then return multiple_conditions(conditions)
        end
      end

      #Returns whether the seach should interrogate only children, or all descendants. If neither is specified, the default
      #is to search the descendants. The condition hash should contain one of the following options:
      #  :scope => :children
      #  :scope => :descendants
      #  nothing
      def scope_for(condition_hash)
        case condition_hash[:scope]
        when :children          then System::Windows::Automation::TreeScope.Children
        when :descendants, nil  then System::Windows::Automation::TreeScope.Descendants
        end
      end

      #Returns whether the seach should stop at the first element that matches the criteria or whether it should find all
      #elements that match. If neither is specified, the default is to find only the first element that matches. The condition
      #hash should contain one of the following options:
      #  :how_many => :first
      #  :how_many => :all
      #  nothing
      def how_many_for(condition_hash)
        case condition_hash[:how_many]
        when :first, nil then :find_first
        when :all then :find_all
        else raise "Invalid number of elements to look for. Use ':first' or ':all'"
        end
      end

      private

      #Used to create an AndCondition that takes into account all of the search conditions. This is done by
      #creating a single condition for each of the conditions and then creating an AndCondition combining
      #the individual search conditions
      def multiple_conditions(condition_hash)
        condition_array = []
        condition_hash.keys.each {|key| condition_array << single_condition({key => condition_hash[key]}) }
        System::Windows::Automation::AndCondition.new(r_array_to_cs_array_of_conditions(condition_array))
      end

      #Calls the condition hash's corresponding condition creation method
      def single_condition(condition_hash)
        case condition_hash.keys.first
        when :id    then id_condition(condition_hash)
        when :name  then name_condition(condition_hash)
        when :type  then type_condition(condition_hash)
        end
      end

      #Returns a PropertyCondition when :id has been specified as the condition type
      def id_condition(condition_hash)
        value = r_string_to_c_string(condition_hash[:id].to_s)
        System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.automation_id_property, value)
      end

      #Returns a PropertyCondition when :name has been specified as the condition type
      def name_condition(condition_hash)
        value = r_string_to_c_string(condition_hash[:name])
        System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.name_property, value)
      end

      #Returns a PropertyCondition when :type has been specified as the condition type
      def type_condition(condition_hash)
        value = Bewildr::ControlType.enum_for_symbol(condition_hash[:type])
        System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.control_type_property, value)
      end
    end
  end
end
