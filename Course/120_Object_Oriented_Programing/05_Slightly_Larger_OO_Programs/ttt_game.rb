module GameHelper
  WIDTH = 48

  def clear_screen
    system('clear') || system('cls')
  end

  def input_prompt
    print "=> ".rjust(WIDTH / 2)
  end

  def press_return_to_continue
    blank_line_and_output_to_display('', "Press return to continue", '')
    gets
    clear_screen
  end

  def align_text(left, middle, right)
    if left == '' && right == ''
      middle.center(WIDTH)
    else
      left.ljust(WIDTH / 4) + middle.center(WIDTH / 2) + right.rjust(WIDTH / 4)
    end
  end

  def blank_line_and_output_to_display(left, middle, right)
    puts
    puts align_text(left, middle, right)
  end

  def output_to_diplay(left, middle, right)
    puts align_text(left, middle, right)
  end

  def display_heading(heading)
    output_to_diplay('', heading, '')
    puts
  end

  def y_or_n?
    answer = nil
    loop do
      input_prompt
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      invalid_choice
    end
    answer == 'y'
  end

  def invalid_choice
    output_to_diplay('', 'That is an invalid input, please try again...', '')
  end
end

class TTTPlayer
  include GameHelper
  attr_accessor :name, :score, :marker

  def initialize
    set_name
    @score = 0
  end

  def reset
    @score = 0
  end
end

class Human < TTTPlayer
  def set_name
    clear_screen
    display_heading(TTTGame::HEADING)
    n = ''
    loop do
      output_to_diplay('', "What is your name?", '')
      input_prompt
      n = gets.chomp.strip
      break unless n.empty?
      invalid_choice
    end
    self.name = n
    clear_screen
  end

  def move!(board)
    available_choices = board.empty_square_keys
    available_choices_string = board.empty_squares_string
    human_choice = ''
    output_to_diplay('', "Please choose one of the following squares:", '')
    output_to_diplay('', available_choices_string, '')
    loop do
      input_prompt
      human_choice = gets.chomp
      break if human_choice.to_i.to_s == human_choice &&
               available_choices.include?(human_choice.to_i)
      invalid_choice
      output_to_diplay('', "Choose from: #{available_choices_string}", '')
    end
    board[human_choice.to_i] = marker
  end
end

class Computer < TTTPlayer
  def set_name
    self.name = %w[R2D2 C-3PO Hal Chappie].sample
  end

  def move!(board, human_marker)
    at_risk_square = board.find_at_risk_square(human_marker)
    winning_square = board.find_winning_square(marker)
    computer_choice = if winning_square
                        winning_square
                      elsif at_risk_square
                        at_risk_square
                      elsif board.empty_square_keys.include?(5)
                        5
                      else
                        board.empty_square_keys.sample
                      end
    board[computer_choice] = marker
  end
end

class Square
  attr_accessor :marker

  def to_s
    marker ? marker : " "
  end

  def empty?
    !marker
  end

  def marked?
    !!marker
  end
end

class Board
  include GameHelper

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  attr_reader :squares

  def initialize
    @squares = Hash.new
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/LineLength
  def draw
    puts
    output_to_diplay('', "     |     |     ", '')
    output_to_diplay('', " #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}  ", '')
    output_to_diplay('', "     |     |     ", '')
    output_to_diplay('', "-----+-----+-----", '')
    output_to_diplay('', "     |     |     ", '')
    output_to_diplay('', " #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}  ", '')
    output_to_diplay('', "     |     |     ", '')
    output_to_diplay('', "-----+-----+-----", '')
    output_to_diplay('', "     |     |     ", '')
    output_to_diplay('', " #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}  ", '')
    output_to_diplay('', "     |     |     ", '')
    puts
  end
  # rubocop:enable Metrics/LineLength
  # rubocop:enable Metrics/AbcSiz

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def empty_square_keys
    @squares.select { |_, square| square.empty? }.keys
  end

  def empty_squares_string
    empty_square_keys.join(', ').gsub(/, (\d+)$/, ' or \1')
  end

  def full?
    empty_square_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      first_marker = squares[line[0]]
      if first_marker.marked? && all_marked_with?(line, first_marker.marker)
        return first_marker.marker
      end
    end
    nil
  end

  def all_marked_with?(line, marker)
    line.all? { |key| squares[key].marker == marker }
  end

  def two_of_three_marked?(line, marker)
    line.count { |key| squares[key].marker == marker } == 2 &&
      line.one? { |key| !squares[key].marker }
  end

  def find_at_risk_square(opponent_marker)
    find_winning_square(opponent_marker)
  end

  def find_winning_square(marker)
    WINNING_LINES.each do |line|
      if two_of_three_marked?(line, marker)
        return line.select { |key| !squares[key].marker }.first
      end
    end
    nil
  end
end

class TTTGame
  include GameHelper

  HEADING = "-- Tic Tac Toe --"
  PLAYER1_MARKER = 'X'
  PLAYER2_MARKER = 'O'

  attr_accessor :current_player, :rounds, :first_player
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    set_markers
    rounds_for_victory
    loop do
      play_game
      break unless play_again?
      display_play_again
      reset_game
    end
    display_goodbye_message
  end

  private

  def play_game
    pick_first_player
    loop do
      display_first_player
      play_round
      break if someone_won_game?
      reset_round
    end
    display_game_result
  end

  def play_round
    self.current_player = first_player
    display_board
    loop do
      current_player_moves
      display_board
      break if board.someone_won? || board.full?
    end
    increment_score
    display_board
    display_round_result
  end

  def display_welcome_message
    clear_screen
    display_heading(HEADING)
    output_to_diplay('', "Hi #{human.name}, welcome to Tic Tac Toe", '')
    press_return_to_continue
  end

  def display_goodbye_message
    output_to_diplay('', "Thanks for playing Tic Tac Toe, good bye!", '')
  end

  def display_board
    clear_screen
    display_heading(HEADING)
    human_name_and_marker = "#{human.name} is: #{human.marker}"
    computer_name_and_marker = "#{computer.name} is: #{computer.marker}"
    score = "#{human.score}/#{rounds} : Score : #{computer.score}/#{rounds}"
    output_to_diplay(human_name_and_marker, score, computer_name_and_marker)
    board.draw
  end

  def display_round_result
    winning_phrase = if board.winning_marker == human.marker
                       "#{human.name} won!"
                     elsif board.winning_marker == computer.marker
                       "#{computer.name} won!"
                     else
                       "It's a tie!"
                     end
    output_to_diplay('', winning_phrase, '')
    press_return_to_continue
  end

  def display_game_result
    display_heading(HEADING)
    msg = "#{who_won_game} won #{rounds} round(s) to win the game!"
    output_to_diplay('', msg, '')
  end

  def display_play_again
    output_to_diplay('', "Great, let's play again!", '')
    press_return_to_continue
  end

  def display_first_player
    display_heading(HEADING)
    output_to_diplay('', "#{first_player.name} will go first.", '')
    press_return_to_continue
  end

  def play_again?
    output_to_diplay('', "Would you like to play again?", '')
    y_or_n?
  end

  def increment_score
    if board.winning_marker == human.marker
      human.score += 1
    elsif board.winning_marker == computer.marker
      computer.score += 1
    end
  end

  def who_won_game
    if human.score == rounds
      human.name
    else
      computer.name
    end
  end

  def someone_won_game?
    rounds == human.score || rounds == computer.score
  end

  def rounds_for_victory
    display_heading(HEADING)
    choice = ''
    output_to_diplay('', "How many rounds for victory?", '')
    loop do
      input_prompt
      choice = gets.chomp
      break if choice.to_i.to_s == choice
      invalid_choice
      output_to_diplay('', "Please enter only numbers", '')
    end
    clear_screen
    self.rounds = choice.to_i
  end

  def reset_round
    board.reset
    alternate_first_player
  end

  def reset_game
    board.reset
    human.reset
    computer.reset
  end

  def pick_first_player
    self.first_player = if [1, 2].sample == 1
                          human
                        else
                          computer
                        end
  end

  def alternate_first_player
    self.first_player = if first_player == human
                          computer
                        else
                          human
                        end
  end

  def set_markers
    if custom_markers?
      human.marker = player_pick_marker
      characters_left = ('A'..'Z').reject { |char| char == human.marker }
      computer.marker = characters_left.sample
    else
      human.marker = PLAYER1_MARKER
      computer.marker = PLAYER2_MARKER
    end
  end

  def custom_markers?
    display_heading(HEADING)
    output_to_diplay('', "Would you like to set custom markers this game?", '')
    response = y_or_n?
    clear_screen
    response
  end

  def player_pick_marker
    display_heading(HEADING)
    choice = ''
    output_to_diplay('', "Please enter a character to use for your marker.", '')
    loop do
      output_to_diplay('', "Please choose one character between A - Z.", '')
      input_prompt
      choice = gets.chomp.upcase
      break if ('A'..'Z').cover?(choice) && choice.size == 1
      invalid_choice
    end
    clear_screen
    choice
  end

  def swap_current_player
    self.current_player = if current_player == human
                            computer
                          else
                            human
                          end
  end

  def current_player_moves
    if current_player == human
      human.move!(board)
    else
      computer.move!(board, human.marker)
    end
    swap_current_player
  end
end

TTTGame.new.play
