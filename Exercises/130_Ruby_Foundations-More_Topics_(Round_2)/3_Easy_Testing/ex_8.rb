# ex_8.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_kind
    value = 1
    assert_kind_of(Numeric, value)
  end
end
