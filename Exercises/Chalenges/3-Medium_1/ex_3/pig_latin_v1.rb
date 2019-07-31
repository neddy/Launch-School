require 'pry'

class PigLatin
  VOWELS = %w(a e i o u).freeze
  SPECIAL_CONSTANTS = %w(x y)
  # CONSTANTS = ('a'..'z').to_a.delete_if { |char| VOWELS.include?(char) }.freeze

  attr_reader :pig_latin_words, :words

  def initialize(words)
    @words = words.split(' ')
  end

  def process_words
    @pig_latin_words = []
    words.each do |word|
      pig_latin_words << if VOWELS.include?(word[0])
                           translate_vowel(word)
                         elsif SPECIAL_CONSTANTS.include?(word[0])
                           translate_special_constant(word)
                         else
                           translate_constant(word)
                         end
    end
  end

  def pig_latin
    process_words
    pig_latin_words.join(' ')
  end

  def self.translate(words)
    PigLatin.new(words).pig_latin
  end

  private

  def translate_vowel(word)
    word + "ay"
  end

  def translate_special_constant(word)
    if VOWELS.include?(word[1])
      translate_constant(word)
    else
      translate_vowel(word)
    end
  end

  def translate_constant(word)
    first_vowel_idx = word.index(/[#{VOWELS.join('')}]/)
    first_vowel_idx = word.size unless first_vowel_idx
    starting_constants = word[0..first_vowel_idx - 1]
    remaining_letters = word[first_vowel_idx..-1]

    if starting_constants[-1] == 'q' && remaining_letters[0] == 'u'
      starting_constants << remaining_letters.slice!(0)
    end

    remaining_letters + starting_constants + "ay"
  end
end

# p PigLatin::CONSTANTS
# test_latin = PigLatin.new("test each year quest")
# test_latin.process_words
# p test_latin.pig_latin_words
# p PigLatin.translate('apple')
