# ex_1.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_value
    value = 2
    assert_equal(true, value.odd?)
  end
end
