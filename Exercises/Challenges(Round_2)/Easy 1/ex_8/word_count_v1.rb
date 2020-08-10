class Phrase
  def initialize(string)
    @words = process_string(string)
  end

  def word_count
    words_register = Hash.new(0)
    @words.each do |word|
      words_register[word] += 1
    end
    words_register
  end

  private

  def process_string(string)
    clean_string = string.downcase
    clean_string = clean_string.gsub(/[^a-z0-9'\s]/i, " ")
    clean_string = clean_string.gsub(/\s'|'\s/, " ")
    clean_string.split(/\s+/)
  end
end



# phrase = Phrase.new("All the king's horses; and all the 'kings' men")
# p phrase.word_count

# phrase = Phrase.new("one,\ntwo,\nthree")
# p phrase.word_count
