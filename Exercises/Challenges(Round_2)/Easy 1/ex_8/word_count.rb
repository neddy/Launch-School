class Phrase
  def initialize(string)
    @words = process_string(string)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end

  private

  def process_string(string)
    string.downcase.scan(/\b\w*'?\w+\b/)
  end
end

# class Phrase
#   def initialize(string)
#     @words = process_string(string)
#   end
#
#   def word_count
#     words_register = Hash.new(0)
#     @words.each do |word|
#       words_register[word] += 1
#     end
#     words_register
#   end
#
#   private
#
#   def process_string(string)
#     string.downcase.scan(/\b[\w']+\b/)
#   end
# end



# phrase = Phrase.new("All the king's horses; and all the 'kings' men")
# p phrase.word_count

# phrase = Phrase.new("one,\ntwo,\nthree")
# p phrase.word_count
