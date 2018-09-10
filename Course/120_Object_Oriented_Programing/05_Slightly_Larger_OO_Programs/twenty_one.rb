require 'pry'

module GameHelper
  WIDTH = 48

  def output(*msg)
    case msg.size
    when 1
      output_center(msg)
    when 2
      output_left_right(msg)
    when 3
      output_left_center_right(msg)
    end
  end

  def output_center(msg)
    puts msg[0].center(WIDTH)
  end

  def output_left_right(msg)
    puts msg[0].ljust(WIDTH / 2) + msg[1].rjust(WIDTH / 2)
  end

  def output_left_center_right(msg)
    puts msg[0].ljust(WIDTH / 4) +
         msg[1].center(WIDTH / 2) +
         msg[2].rjust(WIDTH / 4)
  end

  def display_heading(heading)
    output(heading)
    puts
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

  def press_return_to_continue
    puts
    output("Press return to continue...")
    gets
  end

  def y_and_n?
    output("Please enter y or n.")
    choice = ''
    loop do
      input_prompt
      choice = gets.chomp.downcase
      break if ['y', 'n'].include?(choice)
      invalid_input
    end
    choice == 'y'
  end
end

class Participant
  include GameHelper

  attr_accessor :hand, :name

  def initialize
    set_name
    @hand = []
  end

  def reset
    self.hand = []
  end

  def busted?
    hand_value > 21
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
        "|     #{card.suit_symbol}     |",
        "|           |",
        "|         #{card.rank.rjust(2)}|",
        "└-----------┘"
      ]
    end
  end

  def hand_value
    total = 0
    aces = 0
    aces_reduced_to_one = 0
    hand.each do |card|
      total += card.value
      aces += 1 if card.rank == 'A'
    end
    loop do
      break if total <= 21 || aces == aces_reduced_to_one
      total -= 10
      aces_reduced_to_one += 1
    end
    total
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
    clear_screen
    self.name = name
  end
end

class Dealer < Participant
  def set_name
    self.name = %w[Chappie Hal R2D2 C-3PO].sample
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
end

class Deck
  attr_accessor :cards
  def initialize
    @cards = create_deck
    shuffle_deck
  end

  def create_deck
    Card::RANKS.product(Card::SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end

  def shuffle_deck
    cards.shuffle!
  end

  def dispense_one
    cards.pop
  end
end

class Card
  attr_reader :rank, :suit, :value, :suit_symbol
  SUITS = ['H', 'D', 'S', 'C']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUIT_SYMBOL = { 'H' => '♥', 'D' => '♦', 'S' => '♠', 'C' => '♣' }
  VALUES = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'J' => 10,
    'Q' => 10,
    'K' => 10,
    'A' => 11
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @suit_symbol = SUIT_SYMBOL[suit]
    @value = VALUES[rank]
  end
end

class TwentyOneGame
  include GameHelper
  HEADING = "-- Twenty-One --"

  attr_reader :player, :dealer
  attr_accessor :hide_dealer_second_card, :shuffled_cards

  def initialize
    clear_screen
    display_heading(HEADING)
    @shuffled_cards = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @hide_dealer_second_card = true
  end

  def play
    display_welcome
    loop do
      start_game
      break unless play_again?
      display_play_again
      reset_game
    end
    output("Thanks for playing, good bye!")
  end

  def display_welcome
    display_heading(HEADING)
    output("Welcome to Twenty One #{player.name}")
    output_blank_line
    output("Your dealer will be #{dealer.name}")
    press_return_to_continue
  end

  def display_play_again
    clear_screen
    display_heading(HEADING)
    output("Great, let's play again!")
    press_return_to_continue
  end

  def play_again?
    puts
    output("Would you like to play again?")
    y_and_n?
  end

  def reset_game
    self.shuffled_cards = Deck.new
    self.hide_dealer_second_card = true
    player.reset
    dealer.reset
  end

  def start_game
    deal_cards
    display_hands
    player_turn
    toggle_hide_dealer_card
    display_hands
    unless player.busted?
      dealer_turn
    end
    show_results
    display_card_totals
  end

  def toggle_hide_dealer_card
    self.hide_dealer_second_card = !hide_dealer_second_card
  end

  def retrieve_player_choice
    output("(H)it or (S)tay?")
    choice = ''
    loop do
      input_prompt
      choice = gets.chomp.downcase
      break if ['h', 's'].include?(choice)
      invalid_input
    end
    choice
  end

  def player_turn
    loop do
      choice = retrieve_player_choice
      player.hand << shuffled_cards.dispense_one if choice == 'h'
      display_hands
      break if choice == 's' || player.busted?
    end
  end

  def dealer_turn
    loop do
      display_hands
      break if dealer.hand_value >= 17 || dealer.busted?
      dealer.hand << shuffled_cards.dispense_one
      output("#{dealer.name} hitting...")
      sleep(1)
    end
    output("#{dealer.name} stays.") unless dealer.busted?
  end

  def deal_cards
    2.times do
      @player.hand << shuffled_cards.dispense_one
      @dealer.hand << shuffled_cards.dispense_one
    end
  end

  def display_hands
    clear_screen
    display_heading(HEADING)
    output("#{dealer.name}'s Hand:", "")
    if hide_dealer_second_card
      dealer.display_hand_hide_second_card
    else
      dealer.display_hand
    end
    output_blank_line
    output("#{player.name}'s Hand:", "")
    player.display_hand
  end

  def display_player_busted
    output("#{player.name} busted! #{dealer.name} wins!")
  end

  def display_dealer_busted
    output("#{dealer.name} busted! #{player.name} wins!")
  end

  def display_player_won
    output("#{player.name} won")
  end

  def display_dealer_won
    output("#{dealer.name} won!")
  end

  def display_tie
    output("It's a tie")
  end

  def display_card_totals
    output_blank_line
    player_total = "#{player.name}'s hand: #{player.hand_value}"
    dealer_total = "#{dealer.name}'s hand: #{dealer.hand_value}"
    output(player_total, dealer_total)
  end

  def show_results
    output_blank_line
    if player.busted?
      display_player_busted
    elsif dealer.busted?
      display_dealer_busted
    elsif player.hand_value > dealer.hand_value
      display_player_won
    elsif player.hand_value < dealer.hand_value
      display_dealer_won
    else
      display_tie
    end
  end
end

TwentyOneGame.new.play
