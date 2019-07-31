# ex_10.rb
#

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_exclude_xyz
    list = ['abc', 'xyz']
    refute_includes(list, 'xyz')
  end
end
