# ex_3.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_nil
    value = nil
    assert_nil(value)
  end
end
