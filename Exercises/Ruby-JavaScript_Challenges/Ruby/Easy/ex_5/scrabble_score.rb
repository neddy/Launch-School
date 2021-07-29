require 'pry'

class Scrabble
  POINTS_LOOKUP = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  attr_reader :score

  def initialize(input)
    @string = input
    @score = calculate_score
  end

  def self.score(input)
    new(input).score
  end

  private

  def calculate_score
    return 0 if @string.nil?

    @string.strip.upcase.chars.reduce(0) do |score, char|
      points = POINTS_LOOKUP.detect do |letters, _|
                 letters.include?(char)
               end.last
      score + points
    end
  end
end

# puts Scrabble.new('street ').score
