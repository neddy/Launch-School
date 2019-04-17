# ex_7.rb
# Type Assertions
# Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_class
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end
end
