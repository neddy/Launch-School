# ex_9.rb
# Deck of Cards
# Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:
#
# class Deck
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze
# end

# The Deck class should provide a #draw method to draw one card at random. If the deck runs out of cards, the deck should reset itself by generating a new set of 52 cards.
#
# Examples:
#
# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# drawn.count { |card| card.rank == 5 } == 4
# drawn.count { |card| card.suit == 'Hearts' } == 13
#
# drawn2 = []
# 52.times { drawn2 << deck.draw }
# drawn != drawn2 # Almost always.

# Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.

class Card
  include Comparable

  SORT_VALUES = {
    "Jack" => 11,
    "Queen" => 12,
    "King" => 13,
    "Ace" => 14
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    value <=> other.value
  end

  protected

  def value
    if rank.class == Integer
      rank
    else
      SORT_VALUES[rank]
    end
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if cards.empty?
    cards.pop
  end

  private
  attr_accessor :cards

  def create_deck
    RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end

  def shuffle_cards
    cards.shuffle!
  end

  def reset
    @cards = create_deck
    shuffle_cards
  end
end

# deck = Deck.new
#
# drawn = []
# drawn << deck.draw
# p drawn

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
# p drawn
# p drawn2
p drawn != drawn2 # Almost always.
