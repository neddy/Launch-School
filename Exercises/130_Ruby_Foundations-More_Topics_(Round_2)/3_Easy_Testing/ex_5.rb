# ex_5.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_includes_xyz
    list = ['xyz']
    assert_includes(list, 'xyz')
  end
end
