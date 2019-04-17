# ex_6.rb
# Exception Assertions
# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class Testing < MiniTest::Test
  def test_hire
    employee = Employee.new
    assert_raises NoExperienceError do
      employee.hire
    end
  end
end
