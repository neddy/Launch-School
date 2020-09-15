require 'pry'

# LETTER_SCORES = {
#   %w(A E I O U L N R S T) => 1,
#   %w(D G) => 2,
#   %w(B C M P) => 3,
#   %w(F H V W Y) => 4,
#   %w(K) => 5,
#   %w(J X) => 8,
#   %w(Q Z) => 10
# }


# class Scrabble
#   def initialize(word)
#     @word = word
#   end
#
#   def score
#     return 0 unless valid_word?
#     @word.upcase.chars.reduce(0) do |score, letter|
#       LETTER_SCORES.each do |letters, points|
#         score += points if letters.include?(letter)
#       end
#       score
#     end
#   end
#
#   def self.score(word)
#     Scrabble.new(word).score
#   end
#
#   private
#
#   def valid_word?
#     return false unless @word.instance_of?(String) && !@word.empty?
#     !/[^A-Z]/i.match(@word)
#   end
# end

# puts Scrabble.new("aa").score

POINTS_LOOKUP = {
  "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1,
  "N"=>1, "R"=>1, "S"=>1, "T"=>1, "D"=>2, "G"=>2,
  "B"=>3, "C"=>3, "M"=>3, "P"=>3, "F"=>4, "H"=>4,
  "V"=>4, "W"=>4, "Y"=>4, "K"=>5, "J"=>8, "X"=>8,
  "Q"=>10, "Z"=>10
}

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 unless valid_word?
    @word.upcase.chars.map(&POINTS_LOOKUP).sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def valid_word?
    return false unless @word.instance_of?(String) && !@word.empty?
    !/[^A-Z]/i.match(@word)
  end
end

# puts Scrabble.new("aa").score
