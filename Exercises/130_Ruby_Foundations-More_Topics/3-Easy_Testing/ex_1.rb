# ex_1.rb
# Boolean Assertions
# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_value_odd
    value = 5
    assert_equal(true, value.odd?)
  end
end
