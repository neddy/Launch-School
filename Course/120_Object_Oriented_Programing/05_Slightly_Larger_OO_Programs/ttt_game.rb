require 'pry'

# Need to complete 10 and 11 on this page: https://launchschool.com/lessons/97babc46/assignments/d791cc06

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

class Player
  PLAYER1_MARKER = 'X'
  PLAYER2_MARKER = 'O'
  include GameHelper
  attr_accessor :name, :score
  attr_reader :marker

  def initialize
    set_name
    @score = 0
  end

  def reset
    @score = 0
  end
end

class Human < Player
  def initialize
    super
    @marker = PLAYER1_MARKER
  end

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

  def choice(board)
    available_choices = board.empty_square_keys
    n = ''
    output_to_diplay('', "Please choose one of the following squares:", '')
    output_to_diplay('', "#{available_choices.join(', ')}", '')
    loop do
      input_prompt
      n = gets.chomp.strip
      break if n.to_i.to_s == n && available_choices.include?(n.to_i)
      invalid_choice
      output_to_diplay('', "Choose from: #{available_choices.join(', ')}", '')
    end
    n.to_i
  end
end

class Computer < Player
  def initialize
    super
    @marker = PLAYER2_MARKER
  end

  def set_name
    self.name = %w(R2D2 C-3PO Hal Chappie).sample
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

  def draw
    blank_line_and_output_to_display('', "     |     |     ", '')
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
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def empty_square_keys
    @squares.select { |_, square| square.empty? }.keys
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
end

class TTTGame
  include GameHelper

  HEADING = "-- Tic Tac Toe --"

  attr_accessor :current_player
  attr_reader :board, :human, :computer, :first_player

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @first_player = human
    @current_player = @first_player
  end

  def display_welcome_message
    clear_screen
    display_heading(HEADING)
    output_to_diplay('', "Hi #{human.name}, welcome to Tic Tac Toe", '')
  end

  def display_goodbye_message
    output_to_diplay('', "Thanks for playing Tic Tac Toe, good bye!", '')
  end

  def display_board
    clear_screen
    display_heading(HEADING)
    output_to_diplay("#{human.name} is: #{human.marker}", '', "#{computer.name} is: #{computer.marker}")
    board.draw
  end

  def human_move
    human_choice = human.choice(board)
    @board[human_choice] = human.marker
  end

  def computer_move
    computer_choice = board.empty_square_keys.sample
    @board[computer_choice] = computer.marker
  end

  def display_result
    if board.winning_marker == human.marker
      output_to_diplay('', "You won!", '')
    elsif board.winning_marker == computer.marker
      output_to_diplay('', "Computer won!", '')
    else
      output_to_diplay('', "It's a tie!", '')
    end
  end

  def play_again?
    output_to_diplay('', "Would you like to play again?", '')
    y_or_n?
  end

  def reset
    board.reset
    @current_player = @first_player
  end

  def display_play_again
    output_to_diplay('', "Great, let's play again!", '')
    press_return_to_continue
  end

  def swap_current_player
    if current_player == human
      self.current_player = computer
    else
      self.current_player = human
    end
  end

  def current_player_moves
    if current_player == human
      human_move
      swap_current_player
    else
      computer_move
      swap_current_player
    end
  end

  def play
      display_welcome_message
      loop do
        display_board
        loop do
          current_player_moves
          display_board
          break if board.someone_won? || board.full?
        end
        display_board
        display_result
        break unless play_again?
        reset
        display_play_again
      end
      display_goodbye_message
  end
end

TTTGame.new.play
