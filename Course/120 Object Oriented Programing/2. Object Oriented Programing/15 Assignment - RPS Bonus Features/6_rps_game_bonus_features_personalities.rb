# rps_game.rb
require 'pry'

module RPSHelpers
  WIDTH = 72
  def clear_screen
    system('clear') || system('cls')
  end

  def input_prompt
    print "=> ".rjust(WIDTH / 2)
  end

  def press_return_to_continue
    puts
    format_display('', "Press return to continue", '', true)
    gets
    clear_screen
  end

  def format_display(left, middle, right, blank_line_first = false)
    puts if blank_line_first
    if left == '' && right == ''
      puts middle.center(WIDTH)
    else
      puts left.ljust(WIDTH / 3) +
           middle.center(WIDTH / 3) +
           right.rjust(WIDTH / 3)
    end
  end

  def display_heading
    format_display('', "-- Rock, Paper, Scissors, Lizard, Spock --", '')
  end

  def y_or_n?
    answer = nil
    loop do
      input_prompt
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      invalid_choice
    end
    clear_screen
    answer == 'y' ? true : false
  end

  def invalid_choice
    format_display('', 'That is an invalid input, please try again...', '')
  end
end

class Move
  attr_reader :value

  VALID_CHOICES = {
    'r' => 'rock',
    'p' => 'paper',
    'sc' => 'scissors',
    'l' => 'lizard',
    'sp' => 'spock'
  }
  INFERIOR_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }

  def initialize(value)
    @value = value
  end

  def beats?(other_move)
    INFERIOR_MOVES[@value].include?(other_move.value)
  end

  def >(other_move)
    beats?(other_move)
  end

  def <(other_move)
    !beats?(other_move) && @value != other_move.value
  end

  def to_s
    @value
  end
end

class MoveHistory
  include RPSHelpers
  attr_accessor :human_moves, :computer_moves, :winners, :human, :computer

  def initialize(human, computer)
    @human_moves = []
    @computer_moves = []
    @winners = []
    @human = human
    @computer = computer
  end

  def add_round(winner)
    human_moves << human.move.to_s
    computer_moves << computer.move.to_s
    winners << if winner
                 winner.name
               else
                 'tie'
               end
  end

  def display
    display_past_rounds
    press_return_to_continue
  end

  def display_past_rounds
    format_display('', "-- Past Rounds --", '', true)
    format_display(human.name, "** Winner **", computer.name)
    human_moves.size.times do |idx|
      format_display(human_moves[idx], winners[idx], computer_moves[idx])
    end
  end

  def human_same_move?(n)
    return false unless human_moves.size >= n
    human_moves.last(n).uniq == 1
  end

  def human_move_fequency
    move_fequency = Move::VALID_CHOICES.values.map do |mv|
      [mv, human_moves.count(mv)]
    end
    move_fequency.to_h
  end

  def human_favourite_moves
    move_frequency = human_move_fequency
    max_count = move_frequency.values.max
    favourite_moves = move_frequency.select do |_, count|
      count == max_count
    end.keys
    weight = [(0.4 + (0.1 * max_count)), 0.95].min
    if favourite_moves.size <= 2 && max_count > 1
      { moves: favourite_moves, weight: weight }
    else
      { moves: [], weight: 0 }
    end
  end

  def human_won_last?(n = 1)
    return false unless winners.size >= n
    if n == 1
      winners.last == human.name
    else
      winners.last(n).all? { |winner| winner == human.name }
    end
  end

  def human_lost_last?
    winners[-1] == computer.name
  end

  def tie_last?
    winners[-1] == 'tie'
  end

  def human_last_move
    human_moves[-1]
  end
end

class Player
  include RPSHelpers
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def reset
    @score = 0
  end
end

class Human < Player
  def set_name
    clear_screen
    display_heading
    n = ''
    loop do
      format_display('', "What is your name?", '')
      input_prompt
      n = gets.chomp
      break unless n.empty?
      invalid_choice
    end
    self.name = n
    clear_screen
  end

  def display_valid_choices
    format_display('', "Valid Choices", '')
    Move::VALID_CHOICES.each do |key, value|
      choice = if key.size == 1
                 "(#{value[0]})#{value[1..-1]}"
               else
                 "(#{value[0..1]})#{value[2..-1]}"
               end
      format_display('', choice, '')
    end
  end

  def choose
    choice = nil
    valid_choices = Move::VALID_CHOICES
    display_heading
    display_valid_choices
    loop do
      input_prompt
      choice = gets.chomp
      break if valid_choices.keys.include?(choice)
      invalid_choice
    end
    self.move = Move.new(valid_choices[choice])
    clear_screen
  end
end

class Computer < Player
  attr_accessor :weighted_choices, :superior_moves, :show_logic
  attr_accessor :expected_moves, :counter_moves

  SUPERIOR_MOVES = {
    "rock" => ["paper", "spock"],
    "paper" => ["scissors", "lizard"],
    "scissors" => ["rock", "spock"],
    "lizard" => ["rock", "scissors"],
    "spock" => ["paper", "lizard"]
  }

  def set_name
    self.name = ['R2D2', 'Chappie', 'Hal'].sample
  end

  def reset_weighted_choices
    self.weighted_choices = Move::VALID_CHOICES.map { |_, v| [v, 0.2] }.to_h
  end

  def select_next_move(last_move)
    moves_list = Move::VALID_CHOICES.values
    next_move_index = (moves_list.index(last_move) + 1)
    if next_move_index == moves_list.size
      moves_list[0]
    else
      moves_list[next_move_index]
    end
  end

  def determine_counter_moves
    expected_mvs = expected_moves[:moves]
    counter_mvs_hsh = SUPERIOR_MOVES.select do |mv, _|
      expected_mvs[0] == mv || expected_mvs[1] == mv
    end
    counter_mvs = counter_mvs_hsh.values.flatten.uniq
    counter_mvs.reject! do |mv|
      expected_mvs.any? { |e_mv| Move::INFERIOR_MOVES[e_mv].include?(mv) }
    end
    { moves: counter_mvs, weight: expected_moves[:weight] }
  end

  def determine_expected_moves(move_history)
    last_move = move_history.human_last_move
    next_move = select_next_move(last_move)
    if move_history.human_won_last?(2) && move_history.human_same_move?(2)
      # Player May move to next move, or keep last move
      { moves: [next_move, last_move], weight: 0.70 }
    elsif move_history.human_won_last?
      # Player is expected to keep current move
      { moves: [last_move], weight: 0.90 }
    elsif move_history.human_lost_last?
      # Player is expected to move to next move
      { moves: [next_move], weight: 0.80 }
    else # tie
      # Expect human's favourite moves
      move_history.human_favourite_moves
    end
  end

  def calculate_weights(move_history)
    if move_history.human_moves.empty? || counter_moves[:moves].empty?
      reset_weighted_choices
    else
      c_mvs = counter_moves[:moves]
      superior_mv_weight = counter_moves[:weight] / c_mvs.size
      inferior_mv_weight = (1 - counter_moves[:weight]) / (5.0 - c_mvs.size)
      self.weighted_choices = weighted_choices.map do |mv, _|
        if c_mvs.any? { |c_mv| c_mv == mv } #
          [mv, superior_mv_weight.round(4)]
        else
          [mv, inferior_mv_weight.round(4)]
        end
      end.to_h
    end
  end

  def probabilities_to_s(hsh)
    output = hsh.map do |mv, prob|
      "#{mv}: #{(prob * 100).round(2)}%"
    end
    output.join('  ')
  end

  def logic_variables(move_history)
    if move_history.human_moves.empty? || expected_moves[:moves].empty?
      expected_mvs = 'None'
      counter_mvs = 'None'
      weight = "N/A"
    else
      expected_mvs = expected_moves[:moves].join(' or ')
      counter_mvs = counter_moves[:moves].join(' or ')
      weight = (counter_moves[:weight] * 100).round(2)
    end
    return expected_mvs, counter_mvs, weight
  end

  def display_logic(move_history)
    expected_mvs, counter_mvs, weight = logic_variables(move_history)
    format_display('', "-- Computer Logic --", '', true)
    format_display('Expected Moves', 'Confidence', 'Counter Moves')
    format_display(expected_mvs, "#{weight}%", counter_mvs)
    format_display('', 'Probabilities', '', true)
    format_display('', probabilities_to_s(weighted_choices), '')
  end

  def create_counter_plan(move_history)
    unless move_history.human_moves.empty?
      self.expected_moves = determine_expected_moves(move_history)
      self.counter_moves = determine_counter_moves
    end
    calculate_weights(move_history)
  end

  def select_choice
    choice = @weighted_choices.max_by do |_, weight|
      rand**(1.0 / weight)
    end
    self.move = Move.new(choice.first)
  end

  def choose(move_history)
    create_counter_plan(move_history)
    select_choice
  end
end

class ComputerPersonalities < Computer
  attr_accessor :generic_weighted_choices, :move_preferences
  def initialize
    super
    set_move_preferences
  end

  def set_move_preferences
    @move_preferences = {
      "rock" => 0.2,
      "paper" => 0.2,
      "scissors" => 0.2,
      "lizard" => 0.2,
      "spock" => 0.2
    }
  end

  def set_name
    self.name = 'C-3PO'
  end

  def calculate_weights(move_history)
    self.generic_weighted_choices = super
    self.weighted_choices = generic_weighted_choices.map do |mv, weight|
      [mv, ((@move_preferences[mv] + weight) / 2)]
    end.to_h
  end

  def display_logic(move_history)
    super
    msg = "Probabilities Before #{name}'s Preferences Were Considered"
    format_display('', msg, '', true)
    format_display('', probabilities_to_s(generic_weighted_choices), '')
  end
end

class R2D2 < ComputerPersonalities
  def set_move_preferences
    @move_preferences = {
      "rock" => 0.1,
      "paper" => 0.1,
      "scissors" => 0.3,
      "lizard" => 0.1,
      "spock" => 0.4
    }
  end

  def set_name
    self.name = 'R2D2'
  end
end

class C3PO < ComputerPersonalities
  def set_name
    self.name = 'C-3PO'
  end
end

class Chappie < ComputerPersonalities
  def set_move_preferences
    @move_preferences = {
      "rock" => 0.15,
      "paper" => 0.15,
      "scissors" => 0.2,
      "lizard" => 0.3,
      "spock" => 0.2
    }
  end

  def set_name
    self.name = 'Chappie'
  end
end

class Hal < ComputerPersonalities
  def set_move_preferences
    @move_preferences = {
      "rock" => 0.96,
      "paper" => 0.01,
      "scissors" => 0.01,
      "lizard" => 0.01,
      "spock" => 0.01
    }
  end

  def set_name
    self.name = 'Hal'
  end
end

class RPSGame
  include RPSHelpers
  attr_accessor :human, :computer, :winner, :rounds, :move_history
  attr_accessor :current_round
  # WIDTH = 48

  def initialize
    @human = Human.new
    set_computer_player
    set_round_limit
    set_show_logic
    @current_round = 1
  end

  def set_computer_player
    choice = rand(4)
    # choice = 3
    case choice
    when 0
      @computer = R2D2.new
    when 1
      @computer = C3PO.new
    when 2
      @computer = Chappie.new
    when 3
      @computer = Hal.new
    end
  end

  def add_to_score
    winner.score += 1
  end

  def determine_winner
    if human.move > computer.move
      self.winner = human
    elsif human.move < computer.move
      self.winner = computer
    end
    add_to_score if winner
  end

  def choose_moves
    human.choose
    computer.choose(move_history)
  end

  def set_round_limit
    choice = nil
    display_heading
    msg = "Rounds for Victory?"
    format_display('', msg, '')
    loop do
      input_prompt
      choice = gets.chomp
      break if choice.to_i.to_s == choice
      invalid_choice
    end
    self.rounds = choice.to_i
    clear_screen
  end

  def set_show_logic
    computer.show_logic = show_logic?
  end

  def show_logic?
    display_heading
    format_display('', "Display Computer Logic? (y) or (n)", '')
    y_or_n?
  end

  def display_game_start
    display_heading
    msg = "Good luck #{human.name}!"
    format_display('', msg, '')
    msg = "This game you will be playing against: #{computer.name}."
    format_display('', msg, '', true)
    msg = "The first to win #{rounds} rounds will win the game!"
    format_display('', msg, '', true)
    press_return_to_continue
  end

  def display_goodbye_message
    display_heading
    format_display('', "Thanks for playing, Good bye!", '')
  end

  def who_won
    if winner
      "#{winner.name} won!"
    else
      "It's a tie!"
    end
  end

  def display_round
    display_heading
    human_name = human.name
    computer_name = computer.name
    format_display('', "Round: #{current_round}", '')
    format_display(human_name, " ", computer_name)
    format_display(human.move.to_s, who_won, computer.move.to_s)
    computer.display_logic(move_history) if computer.show_logic
    press_return_to_continue
  end

  def display_score
    display_heading
    human_score = "#{human.score}/#{rounds}"
    computer_score = "#{computer.score}/#{rounds}"
    format_display(human.name, "-- Current Score --", computer.name)
    format_display(human_score, " ", computer_score)
  end

  def display_game_winner
    display_heading
    game_winner = if human.score > computer.score
                    human
                  else
                    computer
                  end
    format_display('', "#{game_winner.name} won the game!", '')
    msg = "#{game_winner.name} won #{game_winner.score}"\
    " out of #{current_round} rounds."
    format_display('', msg, '')
  end

  def play_again?
    format_display('', "Would you like to play again? (y) or (n)", '')
    y_or_n?
  end

  def reset_game
    human.reset
    set_computer_player
    set_round_limit
    set_show_logic
    self.current_round = 1
  end

  def reset_winner
    self.winner = nil
  end

  def increment_round
    self.current_round += 1
  end

  def play_game
    self.move_history = MoveHistory.new(@human, @computer)
    loop do
      choose_moves
      determine_winner
      display_round
      display_score
      move_history.add_round(winner)
      move_history.display
      break if human.score == @rounds || computer.score == @rounds
      increment_round
      reset_winner
    end
  end

  def play
    loop do
      display_game_start
      play_game
      display_game_winner
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end
end

RPSGame.new.play
