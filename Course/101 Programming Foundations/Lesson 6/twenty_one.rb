require "pry"

CARDS = {
  2 => { value: [2], used: 0 },
  3 => { value: [3], used: 0 },
  4 => { value: [4], used: 0 },
  5 => { value: [5], used: 0 },
  6 => { value: [6], used: 0 },
  7 => { value: [7], used: 0 },
  8 => { value: [8], used: 0 },
  9 => { value: [9], used: 0 },
  10 => { value: [10], used: 0 },
  "Jack" => { value: [10], used: 0 },
  "Queen" => { value: [10], used: 0 },
  "King" => { value: [10], used: 0 },
  "Ace" => { value: [1, 11], used: 0 }
}

suits = ["Hearts", "Diamonds", "Spades", "Clubs"]

def prompt(message)
  puts "=> #{message}"
end

def initialise_deck(suits)
  deck = {}
  suits.each do |suit|
    deck[suit] = {}
    CARDS.each do |card, details|
      deck[suit][card] = details.clone
    end
  end
  deck
end

def get_available_cards(deck)
  available_cards = []
  deck.map do |suit|
    cards = []
    suit[1].each do |card|
      if card[1][:used] == 0
        cards << card[0]
      end
    end
    if !cards.empty?
      available_cards << [suit[0], cards]
    end
  end
  available_cards.to_h
end

def pick_card(deck)
  available_cards = get_available_cards(deck)
  suit = available_cards.keys.sample
  card = available_cards[suit].sample
  deck[suit][card][:used] = 1
  return { suit: suit, rank: card }, deck
end

def deal(deck)
  player_cards = {}
  dealer_cards = {}
  (1..2).each do |round|
    player_cards[round], deck = pick_card(deck)
    dealer_cards[round], deck = pick_card(deck)
  end
  return player_cards, dealer_cards, deck
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
  if card[:rank].to_s.to_i == card[:rank]
    card[:rank].to_s[0, 2]
  else
    card[:rank].to_s[0]
  end
end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
def print_cards(hand, blank_second=false)
  cards_display = ["", "", "", "", "", "", ""]
  hand.each do |round, card|
    rank = rank_display(card)
    next if blank_second && round == 2
    cards_display[0] << "┌----------┐"
    cards_display[1] << "|#{rank.ljust(2)}        |"
    cards_display[2] << "|          |"
    cards_display[3] << "| #{card[:suit].center(8)} |"
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

def hand_value(hand)
  rounds_use_min = 0
  loop do
    value = 0
    hand.each do |round, card|
      value += if rounds_use_min < round
                 CARDS[card[:rank]][:value].max
               else
                 CARDS[card[:rank]][:value].min
               end
    end
    if value <= 21
      return value
    elsif rounds_use_min == hand.length
      return value
    end
    rounds_use_min += 1
  end
end

def bust?(hand)
  if hand_value(hand) > 21
    true
  end
end

def player_turn(player_hand, dealer_hand, deck)
  round = 3
  loop do
    display_hands(player_hand, dealer_hand, true)
    action = player_input
    if action == "h"
      player_hand[round], deck = pick_card(deck)
      round += 1
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
  round = 3
  while hand_value(dealer_hand) < 17
    dealer_hand[round], deck = pick_card(deck)
    round += 1
  end
  dealer_hand
end

def play_again?
  prompt("Would you like to play again?")
  prompt("'y' to play again, anything else to quit)")
  answer = gets.chomp
  answer.start_with?(/[Yy]/)
end

loop do
  deck = initialise_deck(suits)

  player_hand, dealer_hand, deck = deal(deck)

  player_hand, deck = player_turn(player_hand, dealer_hand, deck)

  unless bust?(player_hand)
    dealer_hand = dealer_turn(dealer_hand, deck)
  end

  display_hands(player_hand, dealer_hand)

  if bust?(player_hand)
    prompt("Player Bust!! Dealer Wins!")
  elsif bust?(dealer_hand)
    prompt("Dealer Bust!! Player Wins!")
  elsif hand_value(player_hand) < hand_value(dealer_hand)
    prompt("Dealer Wins!!")
  elsif hand_value(player_hand) > hand_value(dealer_hand)
    prompt("Player Wins!!")
  else
    prompt("It's a tie!")
  end

  prompt("Player: #{hand_value(player_hand)} Dealer: #{hand_value(dealer_hand)}")
  prompt("Game Over")
  break unless play_again?
end

prompt("Thanks for playing!")
