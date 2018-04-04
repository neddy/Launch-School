require 'pry'

COMPUTER_FIRST = false
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
@choice = nil

DEBUGGING = true # Turn on debugging for minimax

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
  if arr.length > 2
    arr[-1] = "#{join_word} #{arr.last}"
    arr.join(separator)
  else
    arr.join(" #{join_word} ")
  end
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

def score(board)
  if detect_winner(board) == 'Player'
    -10
  elsif detect_winner(board) == 'Computer'
    10
  else
    0
  end
end

def debugg_minimax(new_board, scores, moves)
  if scores.length == @counter
    display_board(new_board)
    prompt "Scores: #{scores}"
    prompt "Moves : #{moves}"
    gets
  end
end

def minimax(board, player = 'Computer')
  return score(board) if detect_winner(board)
  scores = []
  moves = []
  new_board = board.dup
  marker = player == 'Computer' ? COMPUTER_MARKER : PLAYER_MARKER

  empty_squares(board).each do |move|
    new_board[move] = marker
    scores << minimax(new_board, alternate_player(player))
    new_board[move] = INITIAL_MARKER
    moves << move
  end

  debugg_minimax(new_board, scores, moves) if DEBUGGING

  if player == "Computer"
    max_score_index = scores.each_with_index.max[1]
    @choice = moves[max_score_index]
    return scores[max_score_index]
  else
    min_score_index = scores.each_with_index.min[1]
    return scores[min_score_index]
  end
end

def computer_minimax(brd)
  minimax(brd)
  @counter -= 2
  brd[@choice] = COMPUTER_MARKER
end

def place_piece!(board, player)
  if player == 'Player'
    player_places_peice(board)
  else
    computer_minimax(board)
    # computer_places_peice(board)
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    'Computer'
  else
    'Player'
  end
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
    elsif board_full?(brd)
      return 'Tie'
    end
  end
  nil
end

score = { player: 0, computer: 0 }

loop do
  @counter = 8 # Counter for debugging minimax / viewing algorithim final arrays
  board = initialise_board
  current_player = COMPUTER_FIRST ? 'Computer' : 'Player'

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if detect_winner(board)
  end

  display_board(board)
  if detect_winner(board) == "Player"
    score[:player] += 1
    prompt "Player won!"
  elsif detect_winner(board) == "Computer"
    prompt "Computer won!"
    score[:computer] += 1
  else
    prompt "It's a tie"
  end

  prompt "Score: Player: #{score[:player]} Computer: #{score[:computer]}"

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
