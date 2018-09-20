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
    value <=> other.value
  end

  def value
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
  def initialize(cards)
    @cards = []
    @rank_count = Hash.new(0)

    5.times do
      card = cards.draw
      @cards << card
      @rank_count[card.rank] += 1
    end
  end

  def print
    puts @cards
  end

  def evaluate
    if    royal_flush?     then 'Royal flush'
    elsif straight_flush?  then 'Straight flush'
    elsif four_of_a_kind?  then 'Four of a kind'
    elsif full_house?      then 'Full house'
    elsif flush?           then 'Flush'
    elsif straight?        then 'Straight'
    elsif three_of_a_kind? then 'Three of a kind'
    elsif two_pair?        then 'Two pair'
    elsif pair?            then 'Pair'
    else 'High card'
    end
  end

  private

  def flush?
    suit = @cards.first.suit
    @cards.all? { |card| card.suit == suit }
  end

  def straight?
    return false if @rank_count.any? { |_, count| count > 1 }

    @cards.min.value == @cards.max.value - 4 || ace_low_straight?
  end

  def ace_low_straight?
    return false if @rank_count.any? { |_, count| count > 1 }

    sorted_cards = @cards.sort
    if sorted_cards[0].rank == 2 && sorted_cards[4].rank == 'Ace'
      sorted_cards[0].value == sorted_cards[3].value - 3
    else
      false
    end
  end

  def n_of_a_kind?(number)
    @rank_count.one? { |_, count| count == number }
  end

  def straight_flush?
    flush? && straight?
  end

  def royal_flush?
    straight_flush? && @cards.min.rank == 10
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    @rank_count.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

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
puts hand.evaluate
