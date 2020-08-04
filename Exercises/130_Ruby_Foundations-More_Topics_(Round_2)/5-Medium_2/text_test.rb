require 'minitest/autorun'

require_relative 'text.rb'


class TextTest < MiniTest::Test
  def setup
    @text_file = File.open('text.txt', 'r')
  end

  # Q9
  def test_swap
    text = Text.new(@text_file.read)

    new_text = <<~HEREDOC
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
    HEREDOC

    assert_equal(new_text, text.swap('a', 'e'))
  end

  # Q10
  def test_word_count
    text = Text.new(@text_file.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    @text_file.close
  end
end
