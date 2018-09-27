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

  def busted?
    value > 21
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

  attr_writer :stay

  def initialize
    set_name
  end

  def reset
    self.hand = Hand.new
    self.stay = false
  end

  def stay?
    @stay
  end
end

class Player < Participant
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
end

class Dealer < Participant
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
    @player = Player.new
    @dealer = Dealer.new
    reset
  end

  def play
    display_welcome
    loop do
      play_round
      break unless play_again?
      display_play_again
      reset
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
    unless player.hand.busted?
      take_turn(dealer)
    end
    show_results
    display_card_totals
  end

  def reset
    self.deck = Deck.new
    player.reset
    dealer.reset
    dealer.hand.hide_second_card
  end

  def play_again?
    output_blank_line
    output_center("Would you like to play again?")
    y_and_n?
  end

  def draw_card(participant)
    participant.hand << deck.draw_one
  end

  def deal_cards
    2.times do
      draw_card(player)
      draw_card(dealer)
    end
  end

  def take_turn(participant)
    loop do
      choice = retrieve_choice(participant)
      if choice == 'h'
        draw_card(participant)
        output_center("#{participant.name} hitting...")
      else
        output_center("#{participant.name} stays.")
        participant.stay = true
      end

      sleep(0.5)

      display_hands
      break if participant.stay? || participant.hand.busted?
    end
  end

  def retrieve_choice(participant)
    if participant == player
      output_center("(H)it or (S)tay?")
      choice = ''
      loop do
        input_prompt
        choice = gets.chomp.downcase
        break if ['h', 's'].include?(choice)
        invalid_input
      end
      choice
    else
      dealer.hand.value >= 17 ? 's' : 'h'
    end
  end

  def determine_result
    player_hand_value = player.hand.value
    dealer_hand_value = dealer.hand.value
    if player.hand.busted?
      :player_busted
    elsif dealer.hand.busted?
      :dealer_busted
    elsif player_hand_value > dealer_hand_value
      :player_won
    elsif player_hand_value < dealer_hand_value
      :dealer_won
    else
      :tie
    end
  end

  def display_hands
    clear_screen
    display_heading(HEADING)
    output_left_right("#{dealer.name}'s Hand:", "")
    dealer.hand.display
    output_blank_line
    output_left_right("#{player.name}'s Hand:", "")
    player.hand.display
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
    player_total = "#{player.name}'s hand: #{player.hand.value}"
    dealer_total = "#{dealer.name}'s hand: #{dealer.hand.value}"
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
