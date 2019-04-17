# ex_9.rb
# Same Object Assertions
# Write a unit test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_same
    list = []
    assert_same list, list.process
  end
end
