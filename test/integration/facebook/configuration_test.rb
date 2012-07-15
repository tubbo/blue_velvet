require 'test_helper'

class Facebook::ConfigurationTest < ActiveSupport::TestCase
  Facebook.config.each { |attribute, setting|
    an = if attribute == 'app_id'
           "an"
         else
           "a"
         end

    test "have #{an} #{attribute}" do
      %w(equal nil empty).each { |question|
        if question == 'equal'
          refute_equal "", setting
        else
          self.send :"refute_#{question}", setting
        end
      }
    end
  }
end
