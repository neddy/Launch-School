# ex_9.rb
#

class List
  def process
    self
  end
end

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Testing < MiniTest::Test
  def test_same_object
    list = List.new
    assert_same(list, list.process)
  end
end
