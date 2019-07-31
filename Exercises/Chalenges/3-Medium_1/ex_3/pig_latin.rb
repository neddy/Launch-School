require 'pry'

class PigLatin
  VOWELS = %w(a e i o u).freeze
  SPECIAL_CONSTANTS = %w(x y)
  # CONSTANTS = ('a'..'z').to_a.delete_if { |char| VOWELS.include?(char) }.freeze

  attr_reader :pig_latin_words, :words

  def initialize(words)
    @words = words.split(' ')
  end

  def self.translate(words)
    PigLatin.new(words).translate
  end

  def translate
    @pig_latin_words = []
    words.each do |word|
      @pig_latin_words << translate_word(word)
    end
    pig_latin_words.join(' ')
  end

  def translate_word(word)
    if word.match(/^[#{VOWELS}]|^[xy][^#{VOWELS}]/)
      word + 'ay'
    else
       starting_consonants, remaining_letters = parse_consonant(word)
       remaining_letters + starting_consonants + 'ay'
    end
  end

  def parse_consonant(word)
    starting_consonants = word[/[^aeiou]*qu|[^aeiou]+(?=[aeiou])/]
    if starting_consonants
      remaining_letters = word[(starting_consonants.size)..-1]
    else
      remaining_letters = word
    end
    [starting_consonants, remaining_letters]
  end
end

# p PigLatin::CONSTANTS
# test_latin = PigLatin.new("test each year quest yttria nderqualified")
# p test_latin.translate
# p test_latin.pig_latin_words
# p PigLatin.translate('apple')
