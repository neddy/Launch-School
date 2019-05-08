class Anagram
  def initialize(word)
    @given_word = word
    @sorted_letters = chars_array(word)
  end

  def match(array)
    array.select do |word|
      word.downcase != @given_word.downcase &&
        chars_array(word) == @sorted_letters
    end
  end

  private

  def chars_array(word)
    word.downcase.chars.sort
  end
end

# testing = Anagram.new("test")
# p testing.match(["Sett", "this", "That", "Test"])
