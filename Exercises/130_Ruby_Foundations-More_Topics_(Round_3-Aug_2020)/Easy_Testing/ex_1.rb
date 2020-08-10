require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ExTest < MiniTest::Test
  def test_ex1
    assert_equal(true, value.odd?)
  end
end
