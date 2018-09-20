module GameHelper
  WIDTH = 48

  def output(*msg)
    case msg.size
    when 1 then output_center(msg)
    when 2 then output_left_right(msg)
    when 3 then output_left_center_right(msg)
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
    output_blank_line
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
    output_blank_line
    output("Press return to continue...")
    output_blank_line
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

class Hand
  def initialize
    @cards = []
  end

  def display
    cards_array = create_cards_output_array
    output_cards(cards_array)
  end

  def display_hide_card
    cards_array = create_cards_output_array
    hide_second_card!(cards_array)
    output_cards(cards_array)
  end

  def value
    total = 0
    aces = 0
    aces_reduced_to_one = 0
    cards.each do |card|
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

  def <<(card)
    cards << card
  end

  private

  attr_accessor :cards

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
    cards.map do |card|
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

class Participant
  include GameHelper

  attr_accessor :name

  def initialize
    set_name
    reset
  end

  def reset
    self.hand = Hand.new
    self.stay = false
  end

  def draw_card(deck)
    hand << deck.draw_one
  end

  def busted?
    hand.value > 21
  end

  def hand_value
    hand.value
  end

  def display_hand
    hand.display
  end

  private

  attr_accessor :stay, :hand
end

class Player < Participant
  def take_turn(deck)
    choice = retrieve_player_choice
    if choice == 'h'
      draw_card(deck)
    else
      self.stay = true
    end
  end

  def stay?
    stay
  end

  private

  def set_name
    name = ''
    output('Please enter your name:')
    loop do
      input_prompt
      name = gets.chomp.strip
      break unless name.empty? || name.count("0-z") < 1
      invalid_input
    end
    clear_screen
    self.name = name
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
end

class Dealer < Participant
  def reset
    super
    self.hide_card = true
  end

  def take_turn(deck)
    if hand.value >= 17
      output("#{name} stays.")
      self.stay = true
    else
      output("#{name} hitting...")
      draw_card(deck)
    end
    sleep(1)
  end

  def toggle_hide_card
    self.hide_card = false
  end

  def stay?
    stay
  end

  def display_hand
    if hide_card?
      hand.display_hide_card
    else
      super
    end
  end

  private

  attr_accessor :hide_card

  def set_name
    self.name = %w[Chappie Hal R2D2 C-3PO].sample
  end

  def hide_card?
    hide_card
  end
end

class Deck
  def initialize
    @cards = create_deck
    shuffle_deck
  end

  def draw_one
    cards.pop
  end

  private

  attr_accessor :cards

  def create_deck
    Card::RANKS.product(Card::SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end

  def shuffle_deck
    cards.shuffle!
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

  def initialize
    clear_screen
    display_heading(HEADING)
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @hide_dealer_second_card = true
  end

  def play
    display_welcome
    loop do
      play_round
      break unless play_again?
      display_play_again
      reset_game
    end
    output("Thanks for playing, good bye!")
  end

  private

  attr_reader :player, :dealer
  attr_accessor :deck

  def play_round
    deal_cards
    display_hands
    take_turn(player)
    dealer.toggle_hide_card
    display_hands
    unless player.busted?
      take_turn(dealer)
    end
    show_results
    display_card_totals
  end

  def reset_game
    self.deck = Deck.new
    player.reset
    dealer.reset
  end

  def play_again?
    output_blank_line
    output("Would you like to play again?")
    y_and_n?
  end

  def take_turn(participant)
    loop do
      participant.take_turn(deck)
      display_hands
      break if participant.stay? || participant.busted?
    end
  end

  def deal_cards
    2.times do
      player.draw_card(deck)
      dealer.draw_card(deck)
    end
  end

  def determine_result
    if player.busted?
      :player_busted
    elsif dealer.busted?
      :dealer_busted
    elsif player.hand_value > dealer.hand_value
      :player_won
    elsif player.hand_value < dealer.hand_value
      :dealer_won
    else
      :tie
    end
  end

  def display_hands
    clear_screen
    display_heading(HEADING)
    output("#{dealer.name}'s Hand:", "")
    dealer.display_hand
    output_blank_line
    output("#{player.name}'s Hand:", "")
    player.display_hand
  end

  def show_results
    result = determine_result
    output_blank_line
    case result
    when :player_busted then display_player_busted
    when :dealer_busted then display_dealer_busted
    when :player_won then display_player_won
    when :dealer_won then display_dealer_won
    when :tie then display_tie
    end
  end

  def display_card_totals
    output_blank_line
    player_total = "#{player.name}'s hand: #{player.hand_value}"
    dealer_total = "#{dealer.name}'s hand: #{dealer.hand_value}"
    output(player_total, dealer_total)
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
end

TwentyOneGame.new.play
