#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  class Finder
    extend Bewildr::BewildrHelpers
    
    class << self
      def condition_for(condition_hash)
        conditions = condition_hash.select {|key, value| [:id, :name, :type].include?(key) }
        conditions = Hash[*conditions.flatten]
        case
        when conditions.length == 0 then raise "Condition needs to include at least an :id, a :name or a :type"
        when conditions.length == 1 then return single_condition(conditions)
        when conditions.length > 1  then return multiple_conditions(conditions)
        end
      end

      def scope_for(condition_hash)
        case condition_hash[:scope]
        when :children          then System::Windows::Automation::TreeScope.Children
        when :descendants, nil  then System::Windows::Automation::TreeScope.Descendants
        end
      end

      #returns the method to call
      def how_many_for(condition_hash)
        case condition_hash[:how_many]
        when :first     then :find_first
        when :all, nil  then :find_all
        else raise "Invalid number of elements to look for. Use ':first' or ':all'"
        end
      end

      private

      def multiple_conditions(condition_hash)
        condition_array = []
        condition_hash.keys.each {|key| condition_array << single_condition({key => condition_hash[key]}) }
        System::Windows::Automation::AndCondition.new(r_array_to_cs_array_of_conditions(condition_array))
      end

      def single_condition(condition_hash)
        case condition_hash.keys.first
        when :id    then id_condition(condition_hash)
        when :name  then name_condition(condition_hash)
        when :type  then type_condition(condition_hash)
        end
      end

      def id_condition(condition_hash)
        value = r_string_to_c_string(condition_hash[:id].to_s)
        System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.automation_id_property, value)
      end

      def name_condition(condition_hash)
        value = r_string_to_c_string(condition_hash[:name])
        System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.name_property, value)
      end

      def type_condition(condition_hash)
        value = Bewildr::ControlType.class_for_symbol(condition_hash[:type])
        System::Windows::Automation::PropertyCondition.new(System::Windows::Automation::AutomationElement.control_type_property, value)
      end
    end
  end
end
