require 'pry'

COMPUTER_FIRST = false
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system('clear') || system('cls')
  puts "Player is: #{PLAYER_MARKER} Computer is: #{COMPUTER_MARKER}"
  puts
  puts "     |     |  "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |  "
  puts "-----+-----+-----"
  puts "     |     |  "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |  "
  puts "-----+-----+-----"
  puts "     |     |  "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |  "
  puts
end
# rubocop:enable Metrics/AbcSize

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ', ', join_word = 'or')
  output = ''
  if arr.length > 2
    counter = 0
    loop do
      if counter == arr.length - 1
        output += join_word + ' ' + arr[counter].to_s
        break
      else
        output += arr[counter].to_s + separator
        counter += 1
      end
    end
  else
    output = arr.join(" #{join_word} ")
  end
  output
end

def player_places_peice(brd)
  square = ''
  loop do
    prompt "Please choose a square: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
    (empty_squares(brd) & line)[0]
    (empty_squares(brd) & line)[0]
  else
    nil
  end
end

def find_winning(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
    (empty_squares(brd) & line)[0]
    (empty_squares(brd) & line)[0]
  end
end

def computer_places_peice(brd)
  possible_squares = []
  square = nil

  WINNING_LINES.each do |line|
    possible_squares << find_at_risk(line, brd) if find_at_risk(line, brd)
  end
  square = possible_squares.sample unless possible_squares.empty?

  WINNING_LINES.each do |line|
    square = find_winning(line, brd) if find_winning(line, brd)
  end

  if !square
    if empty_squares(brd).include?(5)
      square = 5
    else
      square = empty_squares(brd).sample
    end
  end
  # binding.pry
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def place_piece!(board, player)
  if player == 'Player'
    player_places_peice(board)
  else
    computer_places_peice(board)
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    'Computer'
  else
    'Player'
  end
end

score = {player: 0, computer: 0}

loop do
  board = initialise_board
  if COMPUTER_FIRST
    current_player = 'Computer'
  else
    current_player = 'Player'
  end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == "Player"
      score[:player] += 1
    else
      score[:computer] += 1
    end
  else
    prompt "It's a tie"
  end

  # prompt "** Current score **"
  prompt "Current score: Player: #{score[:player]} Computer: #{score[:computer]}"

  if score[:player] == 5
    prompt "You won 5 rounds this game, congratulations!"
    break
  elsif score[:computer] == 5
    prompt "The computer won 5 rounds this game, better luck next time!"
    break
  end

  prompt "Would you like to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt "Thanks for playing"
