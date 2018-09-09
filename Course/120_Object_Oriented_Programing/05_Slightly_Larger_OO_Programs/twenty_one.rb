require 'pry'

module GameHelper
  WIDTH = 48

  def output(*msg)
    case msg.size
    when 1
      puts msg[0].center(WIDTH)
    when 2
      puts msg[0].ljust(WIDTH / 2) + msg[1].rjust(WIDTH / 2)
    when 3
      puts puts msg[0].ljust(WIDTH / 4) + msg[1].center(WIDTH / 2) + msg[2].rjust(WIDTH / 4)
    end
  end

  def display_heading(heading)
    output(heading)
  end

  def input_prompt
    print "=>".rjust(WIDTH / 2)
  end

  def invalid_input
    output('Invalid input, please try again.')
  end

  def output_blank_line
    puts
  end

  def clear_screen
    system('clear') || system('cls')
  end
end


class Participant
  attr_accessor :hand, :name

  include GameHelper

  def initialize
    # set_name
    @hand = []
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end

  def display_hand
    cards_array = create_cards_output_array
    output_cards(cards_array)
  end

  def output_cards(cards_array)
    7.times do |idx|
      line = ''
      cards_array.each do |card|
        line << card[idx]
      end
      puts line
    end
  end

  def create_cards_output_array
    hand.map do |card|
      [
        "┌-----------┐",
        "|#{card.rank.ljust(2)}         |",
        "|           |",
        "|     #{card.suit}     |",
        "|           |",
        "|         #{card.rank.rjust(2)}|",
        "└-----------┘"
      ]
    end
  end
end

class Player < Participant
  def set_name
    name = ''
    output('Please enter your name:')
    loop do
      input_prompt
      name = gets.chomp.strip
      break unless name.empty?
      invalid_input
    end
    self.name = name
  end

  def hit
  end

  def stay
  end


end

class Dealer < Participant
  def set_name
    self.name = %w[Chappie Hal R2D2 C-3PO]
  end

  def display_hand_hide_second_card
    cards_array = create_cards_output_array
    hide_second_card!(cards_array)
    output_cards(cards_array)
  end

  def hide_second_card!(cards_array)
    cards_array[1] = [
      "┌-----------┐",
      "|░░░░░░░░░░░|",
      "|░░░░░░░░░░░|",
      "|░░░░░░░░░░░|",
      "|░░░░░░░░░░░|",
      "|░░░░░░░░░░░|",
      "└-----------┘"
    ]
  end

  def hit
  end

  def stay
  end
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUIT_SYMBOL = { 'H' => '♥', 'D' => '♦', 'S' => '♠', 'C' => '♣' }

  attr_accessor :shuffled_cards
  def initialize
    @shuffled_cards = shuffle_deck
  end

  def create_deck
    RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end

  def shuffle_deck
    create_deck.shuffle
  end

  def dispense_card
    shuffle_deck.pop
  end
end

class Card
  VALUES = { '2' => [2], '3' => [3], '4' => [4], '5' => [5], '6' => [6], '7' => [7], '8' => [8], '9' => [9], '10' => [10], 'J' => [10], 'Q' => [10], 'K' => [10], 'A' => [11, 1] }

  attr_accessor :rank, :suit, :value
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = VALUES[rank]
  end
end

class TwentyOneGame
  include GameHelper
  HEADING = "-- Twenty-One --"

  attr_reader :shuffled_cards, :player, :dealer
  attr_accessor :hide_dealer_second_card

  def initialize
    @shuffled_cards = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @hide_dealer_second_card = true
  end

  def start
    deal_cards
    display_hands
    player_turn
    toggle_hide_dealer_card
    # unless player_bust?
    #   # dealer_turn
    #   # show_result
    # end
  end

  def toggle_hide_dealer_card
    self.hide_dealer_second_card = !hide_dealer_second_card
  end

  def player_turn
    loop do
      output("(H)it or (S)tay?")
      choice = ''
      loop do
        input_prompt
        choice = gets.chomp.downcase
        break if ['h', 's'].include?(choice)
        invalid_input
      end
      break if choice == 's'
      player.hand << shuffled_cards.dispense_card
      display_hands
      #break here if bust...
    end
  end

  def deal_cards
    2.times do
      @player.hand << shuffled_cards.dispense_card
      @dealer.hand << shuffled_cards.dispense_card
    end
  end

  def display_hands
    clear_screen
    output(HEADING)
    output_blank_line
    output("Dealers's Hand:", "")
    if hide_dealer_second_card
      dealer.display_hand_hide_second_card
    else
      dealer.display_hand
    end
    output_blank_line
    output("Player's Hand:", "")
    player.display_hand
  end
end

TwentyOneGame.new.start
# Deck.new
