# ex_10.rb
# Poker!
# In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand.
#
# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.
require 'pry'
class Card
  include Comparable

  RANK_SORT_VALUES = {
    "Jack" => 11,
    "Queen" => 12,
    "King" => 13,
    "Ace" => 14
  }

  SUIT_SORT_VALUES = {
    "Diamonds" => 1,
    "Clubs" => 2,
    "Hearts" => 3,
    "Spades" => 1
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def next
    next_card = self.clone
    next_card.rank = Deck::RANKS[Deck::RANKS.index(rank) + 1]
    next_card.rank ? next_card : nil
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    rank_value <=> other.rank_value
  end

  protected
  attr_writer :rank

  def rank_value
    if rank.class == Integer
      rank
    else
      RANK_SORT_VALUES[rank]
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

class PokerHand
  def initialize(deck)
    @hand = []
    draw_cards(deck)
  end

  def print
    puts hand.sort
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  attr_reader :hand

  def draw_cards(deck)
    5.times { @hand << deck.draw }
  end

  def count_cards(card_to_count)
    hand.count { |card| card.rank == card_to_count.rank }
  end

  def royal_flush?
    flush? &&
    hand.all? { |card| card > Card.new(9, 'Hearts') }
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    hand.each do |card_to_count|
      return true if count_cards(card_to_count) == 4
    end
    nil
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def flush?
    hand.all? { |card| hand[0].suit == card.suit }
  end

  def straight?
    sorted_cards = hand.sort
    if sorted_cards.last.rank == 'Ace' && sorted_cards.first.rank == 2
      chunks = sorted_cards[0..3].chunk_while do |card, next_card|
        card.next && card.next.rank == next_card.rank
      end
    else
      chunks = sorted_cards.chunk_while do |card, next_card|
        card.next && card.next.rank == next_card.rank
      end
    end
    chunks.to_a.size == 1
  end

  def three_of_a_kind?
    hand.each do |card_to_count|
      return true if count_cards(card_to_count) == 3
    end
    nil
  end

  def two_pair?
    pairs = 0
    hand.each do |card_to_count|
      pairs += 1 if count_cards(card_to_count) == 2
    end
    pairs == 4
  end

  def pair?
    hand.each do |card_to_count|
      return true if count_cards(card_to_count) == 2
    end
    nil
  end
end

# card = Card.new('Ace', 'Hearts')
# p card.next

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate


# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Clubs'),
  Card.new(3, 'Diamonds'),
  Card.new(4, 'Spades'),
  Card.new(5, 'Diamonds')
])
puts hand.evaluate == 'Straight'

# Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'
#
# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'
#
# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'
#
# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'
#
# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'
#
# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'
#
# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'
#
# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'
#
# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'
#
# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'
