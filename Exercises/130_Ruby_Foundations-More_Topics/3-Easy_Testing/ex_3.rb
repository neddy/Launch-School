# ex_3.rb
# Nil Assertions
# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_value_odd
    value = nil
    assert_nil value
  end
end
