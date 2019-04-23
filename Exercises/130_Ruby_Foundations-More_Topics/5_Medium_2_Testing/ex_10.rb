require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!


class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

class Testing < MiniTest::Test
  def setup
    @file = File.open("ex_8_text.txt", "r")
  end

  def test_count
    input_text = @file.read
    text = Text.new(input_text)
    expected_count = input_text.split.count
    assert_equal expected_count, text.word_count
  end

  def teardown
    @file.close
  end
end
