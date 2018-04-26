# require "pry"

CARDS = {
  2 => { value: [2] },
  3 => { value: [3] },
  4 => { value: [4] },
  5 => { value: [5] },
  6 => { value: [6] },
  7 => { value: [7] },
  8 => { value: [8] },
  9 => { value: [9] },
  10 => { value: [10] },
  "Jack" => { value: [10] },
  "Queen" => { value: [10] },
  "King" => { value: [10] },
  "Ace" => { value: [1, 11] }
}

HAND_LIMIT = 21
DEALER_HIT_UNLESS = 17

SUITS = ["Hearts", "Diamonds", "Spades", "Clubs"]

def prompt(message)
  puts "=> #{message}"
end

def blank_card!(cards_display)
  cards_display[0] << "┌----------┐"
  cards_display[1] << "|░░░░░░░░░░|"
  cards_display[2] << "|░░░░░░░░░░|"
  cards_display[3] << "|░░░░░░░░░░|"
  cards_display[4] << "|░░░░░░░░░░|"
  cards_display[5] << "|░░░░░░░░░░|"
  cards_display[6] << "└----------┘"
  cards_display
end

def rank_display(card)
  if card[0].to_s.to_i == card[0]
    card[0].to_s[0, 2]
  else
    card[0].to_s[0]
  end
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
def print_cards(hand, blank_second=false)
  cards_display = ["", "", "", "", "", "", ""]
  hand.each_with_index do |card, index|
    rank = rank_display(card)
    next if blank_second && index == 1
    cards_display[0] << "┌----------┐"
    cards_display[1] << "|#{rank.ljust(2)}        |"
    cards_display[2] << "|          |"
    cards_display[3] << "| #{card[1].center(8)} |"
    cards_display[4] << "|          |"
    cards_display[5] << "|        #{rank.rjust(2)}|"
    cards_display[6] << "└----------┘"
  end
  blank_card!(cards_display) if blank_second
  cards_display.each do |line|
    puts line
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

def display_hands(player_hand, dealer_hand, hide_dealer=false)
  system('clear') || system('cls')
  puts ">>>>>> Twenty-One <<<<<<"
  prompt("Dealer's Hand:")
  print_cards(dealer_hand, hide_dealer)
  puts
  prompt("Player's Hand:")
  print_cards(player_hand)
end

def initialise_deck
  CARDS.keys.product(SUITS).shuffle
end

def deal(deck)
  player_hand = []
  dealer_hand = []
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
  return player_hand, dealer_hand, deck
end

def player_turn(player_hand, dealer_hand, deck)
  loop do
    display_hands(player_hand, dealer_hand, true)
    action = player_input
    if action == "h"
      player_hand << deck.pop
    else
      return player_hand, deck
    end
    return player_hand, deck if bust?(player_hand)
  end
end

def player_input
  prompt("(H)it or (S)tay?")
  action = ""
  loop do
    action = gets.chomp
    action = action.to_s[0].downcase
    if ["h", "s"].include?(action)
      break
    end
    prompt("Please enter either 'h' for 'hit', or 's' for 'stay':")
  end
  action
end

def dealer_turn(dealer_hand, deck)
  while hand_value(dealer_hand) < DEALER_HIT_UNLESS
    dealer_hand << deck.pop
  end
  dealer_hand
end

def hand_value(hand)
  values = []
  hand.each do |card|
    values << CARDS[card[0]][:value]
  end
  score = 0
  values.each do |value|
    score += value.max
  end
  if score > HAND_LIMIT
    score = minimise_score(values, score)
  end
  score
end

def minimise_score(values, score)
  values.each do |value|
    if value.min != value.max
      score -= value.max
      score += value.min
    end
    return score if score <= HAND_LIMIT
  end
  score
end

def bust?(hand)
  hand_value(hand) > HAND_LIMIT
end

def play_again?
  prompt("Would you like to play again?")
  prompt("'y' to play again, anything else to quit")
  answer = gets.chomp
  answer.start_with?(/[Yy]/)
end

loop do
  scoreboard = { player: 0, dealer: 0 }
  loop do
    deck = initialise_deck
    player_hand, dealer_hand, deck = deal(deck)

    player_hand, deck = player_turn(player_hand, dealer_hand, deck)
    player_score = hand_value(player_hand)

    unless player_score > HAND_LIMIT
      dealer_hand = dealer_turn(dealer_hand, deck)
    end
    dealer_score = hand_value(dealer_hand)

    display_hands(player_hand, dealer_hand)

    if player_score > HAND_LIMIT
      prompt("Player Bust!! Dealer Wins!")
      scoreboard[:dealer] += 1
    elsif dealer_score > HAND_LIMIT
      prompt("Dealer Bust!! Player Wins!")
      scoreboard[:player] += 1
    elsif player_score < dealer_score
      prompt("Dealer Wins!!")
      scoreboard[:dealer] += 1
    elsif player_score > dealer_score
      prompt("Player Wins!!")
      scoreboard[:player] += 1
    else
      prompt("It's a tie!")
    end
    prompt("Hands: (Player: #{player_score} Dealer: #{dealer_score})")
    puts
    puts "***** Scoreboard *****"
    prompt("Player: #{scoreboard[:player]} Dealer: #{scoreboard[:dealer]}")
    puts
    if scoreboard.values.include?(5)
      if scoreboard[:player] == 5
        prompt("The player won 5 rounds to win the game.")
      else
        prompt("The dealer won 5 rounds to win the game.")
      end
      break
    end
    prompt("Hit any key to play the next round")
    gets
  end
  prompt("Game Over")
  puts
  break unless play_again?
end

prompt("Thanks for playing!")
prompt("Good Bye")
