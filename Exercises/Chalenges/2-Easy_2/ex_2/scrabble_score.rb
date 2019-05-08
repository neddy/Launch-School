class Scrabble
  LETTER_POINTS = {
    "AEIOULNRST" => 1,
    "DG" => 2,
    "BCMP" => 3,
    "FHVWY" => 4,
    "K" => 5,
    "JX" => 8,
    "QZ" => 10
  }

  def initialize(word)
    @word = word
    @word.strip! unless @word.nil?
  end

  def score
    return 0 if string_empty_or_nil?

    @word.chars.reduce(0) do |score, char|
      points = LETTER_POINTS.select do |letters, points|
                 letters.include?(char.upcase)
               end.values.first
      score + points
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  def string_empty_or_nil?
    @word == nil || @word.empty?
  end
end

# puts Scrabble.new("cabbage").score
# puts Scrabble.new('OXYPHENBUTAZONE').score
# puts Scrabble.new('quirky ').score

# puts Scrabble.new(nil).score
