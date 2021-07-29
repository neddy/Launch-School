# class Anagram
#   def initialize(initial_word)
#     @initial_word = initial_word
#     @initial_word_sorted = letters_in_order(@initial_word)
#   end
#
#   def match(words)
#     words_hash = {}
#     words.each { |word| words_hash[word] = letters_in_order(word) }
#     words_hash.select do |word, word_sorted_letters|
#       word_sorted_letters == @initial_word_sorted &&
#       word.downcase != @initial_word.downcase
#     end.keys
#   end
#
#   private
#
#   def letters_in_order(string)
#     string.downcase.chars.sort.join
#   end
# end

class Anagram
  def initialize(initial_word)
    @initial_word = initial_word
  end

  def match(words)
    words.select do |word|
      @initial_word.downcase != word.downcase && anagram?(@initial_word, word)
    end
  end

  private

  def letters_in_order(string)
    string.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    letters_in_order(word1) == letters_in_order(word2)
  end
end


# detector = Anagram.new('Orchestra')
# detector.match %w(cashregister Carthorse radishes)
