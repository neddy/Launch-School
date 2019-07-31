# ex_7.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_instance
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end
end
