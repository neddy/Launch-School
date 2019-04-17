# ex_4.rb
# Empty Object Assertions
# Write a minitest assertion that will fail if the Array list is not empty.


require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_array
    list = []
    assert_empty list
  end
end
