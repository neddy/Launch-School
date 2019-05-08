# class Phrase
#   def initialize(phrase)
#     @phrase = phrase.downcase
#   end
#
#   def word_count
#     words_hash = Hash.new(0)
#     words = @phrase.scan(/\w+'\w+|\w+/)
#     words.each { |word| words_hash[word] += 1 }
#     words_hash
#   end
# end
#
# # phrase = Phrase.new("car\n : carpet's carpet's as java : javascript!!&@$%^& large' large")
# # # phrase = Phrase.new("Joe can't tell between 'large' and large.")
# phrase = Phrase.new("Joe can't tell between 'large' and large. is different to Louis")
# p phrase.word_count

# (\w+'\w+)

# test = ("Joe can't tell between this 'large' and large!!&@$%^&.")
# p test.scan(/\w+'\w+|\w+/)

# Further Exploration

# class Phrase
#   def initialize(phrase)
#     @phrase = phrase.downcase
#   end
#
#   def word_count
#     words_hash = Hash.new(0)
#     # p words = @phrase.gsub(/(^'|(?<=\s)')(\w+)'(?=\s|[[:punct:]])/, '\2')
#     # words = @phrase.gsub(/(^'|(?<=\s)')(.+)'(?=\s|[[:punct:]])/, '\2')
#     words = words.scan(/\w+'\w*|\w+/)
#     words.each { |word| words_hash[word] += 1 }
#     words_hash
#   end
# end

# phrase = Phrase.new("car\n : carpet's carpet's as java : javascript!!&@$%^& large' large")
# # phrase = Phrase.new("Joe can't tell between 'large' and large.")
# phrase = Phrase.new("Joe can't tell between 'large' and large or Louis and Louis'.")
# p phrase.word_count

# Further Exploration

class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    words_hash = Hash.new(0)
    words = @phrase.scan(/\w+'\w+|\w+/)
    words.each { |word| words_hash[word] += 1 }
    words_hash
  end
end

# phrase = Phrase.new("car\n : carpet's carpet's as java : javascript!!&@$%^& large' large")
# # phrase = Phrase.new("Joe can't tell between 'large' and large.")
# phrase = Phrase.new("Joe can't tell between 'large' and large or Louis and Louis'.")
# p phrase.word_count
