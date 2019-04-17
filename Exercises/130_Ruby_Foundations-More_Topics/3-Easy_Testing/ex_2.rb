# ex_2.rb
#Equality Assertions
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_value_odd
    value = "XYZ"
    assert_equal("xyz", value.downcase)
  end
end
