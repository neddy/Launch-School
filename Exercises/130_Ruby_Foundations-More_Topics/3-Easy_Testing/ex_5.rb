# ex_5.rb
# Included Object Assertions
# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_array
    list = [1, 2, "xyz"]
    assert_includes list, "xyz"
  end
end
