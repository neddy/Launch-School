# ex_10.rb
# Refutations
# Write a unit test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_refutations
    list = [1, 2, "xyz"]
    refute_includes list, "xyz"
  end
end
