require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_example_string
    oddwords = OddWords.new("whats the matter with kansas.")
    expected_output = "whats eht matter htiw kansas."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end
  
  def test_period_only
    oddwords = OddWords.new(".")
    expected_output = "."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_one_word
    oddwords = OddWords.new("Hello.")
    expected_output = "Hello."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_one_word_space
    oddwords = OddWords.new("Hello .")
    expected_output = "Hello."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_two_words
    oddwords = OddWords.new("Hello world.")
    expected_output = "Hello dlrow."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_two_words_space_before_period
    oddwords = OddWords.new("Hello world .")
    expected_output = "Hello dlrow."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_two_words_space_after_period
    oddwords = OddWords.new("Hello world . ")
    expected_output = "Hello dlrow."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_two_words_many_spaces
    oddwords = OddWords.new("Hello       world.")
    expected_output = "Hello dlrow."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end

  def test_random_spaces
    oddwords = OddWords.new(" This is a  test of    random words .")
    expected_output = "This si a tset of modnar words."
    assert_output(stdout = expected_output, stderr = nil) { oddwords.output_string }
  end
end
