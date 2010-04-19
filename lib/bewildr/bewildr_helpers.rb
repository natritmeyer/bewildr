#Copyright (c) 2010, Nathaniel Ritmeyer. All rights reserved.

module Bewildr
  module BewildrHelpers
    def r_array_to_cs_array_of_strings(args)
      System::Array[System::String].new(args.map {|arg| arg.to_s.to_clr_string})
    end

    def r_array_to_cs_array_of_conditions(args)
      System::Array[System::Windows::Automation::Condition].new(args)
    end

    def r_string_to_c_string(r_string)
      System::String.new(r_string)
    end
  end
end