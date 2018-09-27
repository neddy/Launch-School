module GameHelper
  WIDTH = 48

  def output_center(msg)
    puts msg.center(WIDTH)
  end

  def output_left_right(left, right)
    puts left.ljust(WIDTH / 2) + right.rjust(WIDTH / 2)
  end

  def output_left_center_right(left, center, right)
    puts left.ljust(WIDTH / 4) +
         center.center(WIDTH / 2) +
         right.rjust(WIDTH / 4)
  end

  def display_heading(heading)
    output_center(heading)
    output_blank_line
  end

  def input_prompt
    print "=>".rjust(WIDTH / 2)
  end

  def invalid_input
    output_center('Invalid input, please try again.')
  end

  def output_blank_line
    puts
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def press_return_to_continue
    output_blank_line
    output_center("Press return to continue...")
    gets
  end

  def y_and_n?
    output_center("Please enter y or n.")
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
    self.second_card_hidden = false
  end

  def display
    cards_output_array = create_cards_output_array
    output_cards(cards_output_array)
  end

  def value
    total = 0
    aces = 0
    cards.each do |card|
      total += card.value
      aces += 1 if card.rank == 'A'
    end
    adjust_total_for_aces(total, aces)
  end

  def <<(card)
    cards << card
  end

  def hide_second_card
    self.second_card_hidden = true
  end

  def unhide_second_card
    self.second_card_hidden = false
  end

  private

  attr_accessor :cards, :second_card_hidden

  def adjust_total_for_aces(total, aces)
    aces_reduced_to_one = 0
    loop do
      break if total <= 21 || aces == aces_reduced_to_one
      total -= 10
      aces_reduced_to_one += 1
    end
    total
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
    output_array = cards.map do |card|
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
    hide_second_card!(output_array) if second_card_hidden
    output_array
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

  attr_accessor :name, :hand

  def initialize
    set_name
    reset
  end

  def reset
    self.hand = Hand.new
    self.stay = false
  end

  def deal(deck)
    2.times do
      draw_card(deck)
    end
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

  attr_accessor :stay

  def draw_card(deck)
    hand << deck.draw_one
  end
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
    output_center('Please enter your name:')
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
    output_center("(H)it or (S)tay?")
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
    hand.hide_second_card
  end

  def take_turn(deck)
    if hand.value >= 17
      output_center("#{name} stays.")
      self.stay = true
    else
      output_center("#{name} hitting...")
      draw_card(deck)
    end
    sleep(1)
  end

  def stay?
    stay
  end

  private

  def set_name
    self.name = %w[Chappie Hal R2D2 C-3PO].sample
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
  end

  def play
    display_welcome
    loop do
      play_round
      break unless play_again?
      display_play_again
      reset_game
    end
    output_center("Thanks for playing, good bye!")
  end

  private

  attr_reader :player, :dealer
  attr_accessor :deck

  def play_round
    deal_cards
    display_hands
    take_turn(player)
    dealer.hand.unhide_second_card
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
    output_center("Would you like to play again?")
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
    player.deal(deck)
    dealer.deal(deck)
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
    output_left_right("#{dealer.name}'s Hand:", "")
    dealer.display_hand
    output_blank_line
    output_left_right("#{player.name}'s Hand:", "")
    player.display_hand
  end

  def show_results
    result = determine_result
    output_blank_line
    case result
    when :player_busted then display_busted(player)
    when :dealer_busted then display_busted(dealer)
    when :player_won then display_won(player)
    when :dealer_won then display_won(dealer)
    when :tie then display_tie
    end
  end

  def display_card_totals
    output_blank_line
    player_total = "#{player.name}'s hand: #{player.hand_value}"
    dealer_total = "#{dealer.name}'s hand: #{dealer.hand_value}"
    output_left_right(player_total, dealer_total)
  end

  def display_welcome
    display_heading(HEADING)
    output_center("Welcome to Twenty One #{player.name}")
    output_blank_line
    output_center("Your dealer will be #{dealer.name}")
    press_return_to_continue
  end

  def display_play_again
    clear_screen
    display_heading(HEADING)
    output_center("Great, let's play again!")
    press_return_to_continue
  end

  def display_busted(participant)
    winner = participant == player ? dealer : player
    output_center("#{participant.name} busted! #{winner.name} wins!")
  end

  def display_won(participant)
    output_center("#{participant.name} won!")
  end

  def display_tie
    output_center("It's a tie")
  end
end

TwentyOneGame.new.play
