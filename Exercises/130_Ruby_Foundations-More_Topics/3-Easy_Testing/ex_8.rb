# ex_8.rb
# Kind Assertions
# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_kind_of
    value = 5
    assert_kind_of Numeric, value
  end
end
