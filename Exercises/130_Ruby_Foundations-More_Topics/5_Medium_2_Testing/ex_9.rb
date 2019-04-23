# ex_9.rb
#

# Create expected output file
def expected_output_file
  input_text = File.read("ex_8_text.txt")
  File.open("ex_8_text_expected_output.txt", "w") do |file|
    expected_output = input_text.gsub("a", "e")
    file.write expected_output
  end
end
# expected_output_file # Uncomment this to create expected output file

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
end

class Testing < MiniTest::Test
  def setup
    input_text = File.read("ex_8_text.txt")
    @text = Text.new(input_text)
  end

  def test_swap
    File.open("ex_8_text_output.txt", "w") do |file|
      file.write @text.swap("a", "e")
    end
    output = File.read("ex_8_text_output.txt")
    expected_output = File.read("ex_8_text_expected_output.txt")
    assert_equal expected_output, output
  end

  def teardown
    File.delete("ex_8_text_output.txt") if File.exist?("ex_8_text_output.txt")
  end
end
