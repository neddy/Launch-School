# ex_4.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end
