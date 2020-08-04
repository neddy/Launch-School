# ex_9.rb

class Card
  RANKS = {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    "Jack" => 11,
    "Queen" => 12,
    "King" => 13,
    "Ace" => 14
  }

  attr_reader :rank, :suit
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    RANKS[rank] <=> RANKS[other.rank]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    reset
  end

  def reset
    replenish_deck
    shuffle_deck
  end

  def replenish_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle_deck
    @cards.shuffle!
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end
end

deck = Deck.new
# p deck
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13
#
drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn2.count { |card| card.rank == 5 } == 4
puts drawn2.count { |card| card.suit == 'Hearts' } == 13
puts drawn != drawn2 # Almost always.
