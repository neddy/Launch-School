# ex_6.rb
#
class NoExperienceError < StandardError; end

class Employees
  def hire
    raise NoExperienceError
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Test < MiniTest::Test
  def test_raise_exception
    employee = Employees.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end

# employee = Employees.new
# employee.hire
