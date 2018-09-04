# rpsls_game.rb

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
    output_to_diplay('', "Press return to continue", '', true)
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

  def output_to_diplay(left, middle, right, blank_line_first = false)
    puts if blank_line_first
    puts align_text(left, middle, right)
  end

  def display_heading
    output_to_diplay('', "-- Rock, Paper, Scissors, Lizard, Spock --", '')
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
    INFERIOR_MOVES[value].include?(other_move.value)
  end

  def >(other_move)
    beats?(other_move)
  end

  def <(other_move)
    !beats?(other_move) && value != other_move.value
  end

  def to_s
    value
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

  def output_round(idx)
    output_to_diplay(human_moves[idx], winners[idx], computer_moves[idx])
  end

  def display
    output_to_diplay('', "-- Past Rounds --", '', true)
    output_to_diplay(human.name, "** Winner **", computer.name)
    rounds_played = human_moves.size
    (rounds_played - 1).downto(0).each do |idx|
      output_round(idx)
    end
    press_return_to_continue
  end

  def human_same_move?(n)
    return false unless human_moves.size >= n
    human_moves.last(n).uniq == 1
  end

  def human_move_fequencys
    move_fequencys = Move::VALID_CHOICES.values.map do |mv|
      [mv, human_moves.count(mv)]
    end
    move_fequencys.to_h
  end

  def human_favourite_moves
    move_frequencys = human_move_fequencys
    max_count = move_frequencys.values.max
    favourite_moves = move_frequencys.select do |_, count|
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
      output_to_diplay('', "What is your name?", '')
      input_prompt
      n = gets.chomp.strip
      break unless n.empty?
      invalid_choice
    end
    self.name = n
    clear_screen
  end

  def display_valid_choices
    output_to_diplay('', "Valid Choices", '')
    Move::VALID_CHOICES.each do |key, value|
      choice = if key.size == 1
                 "(#{value[0]})#{value[1..-1]}"
               else
                 "(#{value[0..1]})#{value[2..-1]}"
               end
      output_to_diplay('', choice, '')
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
  attr_accessor :weighted_choices, :superior_moves, :show_logic, :move_history
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

  def next_move_in_sequence(last_move)
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

  def determine_expected_moves
    last_move = move_history.human_last_move
    next_move = next_move_in_sequence(last_move)
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
      # Player is expected to use favourite move
      move_history.human_favourite_moves
    end
  end

  def determine_choice_weights
    if move_history.human_moves.empty? || counter_moves[:moves].empty?
      reset_weighted_choices
    else
      c_mvs = counter_moves[:moves]
      c_mvs_count = c_mvs.size
      c_mvs_weight = counter_moves[:weight]
      superior_mv_weight = c_mvs_weight / c_mvs_count
      inferior_mv_weight = (1 - c_mvs_weight) / (5.0 - c_mvs_count)
      adjust_choice_weights(superior_mv_weight, inferior_mv_weight)
    end
  end

  def adjust_choice_weights(superior_mv_weight, inferior_mv_weight)
    c_mvs = counter_moves[:moves]
    self.weighted_choices = weighted_choices.map do |mv, _|
      if c_mvs.any? { |c_mv| c_mv == mv } #
        [mv, superior_mv_weight.round(4)]
      else
        [mv, inferior_mv_weight.round(4)]
      end
    end.to_h
  end

  def select_choice
    choice = @weighted_choices.max_by do |_, weight|
      rand**(1.0 / weight)
    end
    self.move = Move.new(choice.first)
  end

  def choose
    unless move_history.human_moves.empty?
      self.expected_moves = determine_expected_moves
      self.counter_moves = determine_counter_moves
    end
    determine_choice_weights
    select_choice
  end

  def display_logic
    expected_mvs, counter_mvs, weight = logic_variables
    output_to_diplay('', "-- Computer Logic --", '', true)
    msg = 'Confidence in Expected Move(s)'
    output_to_diplay('Expected Move(s)', msg, 'Counter Move(s)')
    output_to_diplay(expected_mvs, "#{weight}%", counter_mvs)
    output_to_diplay('', 'Probabilities', '', true)
    output_to_diplay('', probabilities_to_s(weighted_choices), '')
  end

  def logic_variables
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

  def probabilities_to_s(hsh)
    output = hsh.map do |mv, prob|
      "#{mv}: #{(prob * 100).round(2)}%"
    end
    output.join('  ')
  end
end

class ComputerPersonalities < Computer
  attr_accessor :generic_weighted_choices, :move_preferences
  def initialize
    super
    set_move_preferences
  end

  def set_move_preferences
    self.move_preferences = {
      "rock" => 0.2,
      "paper" => 0.2,
      "scissors" => 0.2,
      "lizard" => 0.2,
      "spock" => 0.2
    }
  end

  def determine_choice_weights
    super
    personalise_choice_weights
  end

  def personalise_choice_weights
    self.generic_weighted_choices = weighted_choices
    self.weighted_choices = generic_weighted_choices.map do |mv, weight|
      [mv, ((move_preferences[mv] + weight) / 2)]
    end.to_h
  end

  def display_logic
    super
    msg = "Probabilities Before #{name}'s Preferences Were Considered"
    output_to_diplay('', msg, '', true)
    output_to_diplay('', probabilities_to_s(generic_weighted_choices), '')
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

class RPSLSGame
  include RPSHelpers
  attr_accessor :human, :computer, :winner, :rounds, :move_history
  attr_accessor :current_round

  def initialize
    @human = Human.new
    @computer = select_computer_player
    @rounds = rounds_for_victory
    @computer.show_logic = show_logic?
    @current_round = 1
    @move_history = MoveHistory.new(@human, @computer)
    @computer.move_history = move_history
  end

  def select_computer_player
    choice = rand(4)
    # choice = 3
    case choice
    when 0
      R2D2.new
    when 1
      C3PO.new
    when 2
      Chappie.new
    when 3
      Hal.new
    end
  end

  def rounds_for_victory
    choice = nil
    display_heading
    msg = "Rounds for Victory?"
    output_to_diplay('', msg, '')
    loop do
      input_prompt
      choice = gets.chomp
      break if choice.to_i.to_s == choice
      invalid_choice
    end
    clear_screen
    choice.to_i
  end

  def show_logic?
    display_heading
    output_to_diplay('', "Display Computer Logic? (y) or (n)", '')
    response = y_or_n?
    clear_screen
    response
  end

  def add_to_score
    winner.score += 1
  end

  def increment_round
    self.current_round += 1
  end

  def determine_winner
    if human.move > computer.move
      self.winner = human
    elsif human.move < computer.move
      self.winner = computer
    end
    add_to_score if winner
  end

  def who_won
    if winner
      "#{winner.name} won!"
    else
      "It's a tie!"
    end
  end

  def choose_moves
    human.choose
    computer.choose
  end

  def play_again?
    output_to_diplay('', "Would you like to play again? (y) or (n)", '')
    response = y_or_n?
    clear_screen
    response
  end

  def reset_game
    human.reset
    self.computer = select_computer_player
    self.rounds = rounds_for_victory
    computer.show_logic = show_logic?
    self.current_round = 1
    self.move_history = MoveHistory.new(human, computer)
    computer.move_history = move_history
  end

  def reset_winner
    self.winner = nil
  end

  def round_details
    human_name = human.name
    computer_name = computer.name
    human_move = human.move.to_s
    computer_move = computer.move.to_s
    return human_name, computer_name, human_move, computer_move
  end

  def display_game_start
    display_heading
    msg = "Good luck #{human.name}!"
    output_to_diplay('', msg, '')
    msg = "This game you will be playing against: #{computer.name}."
    output_to_diplay('', msg, '', true)
    msg = "The first to win #{rounds} rounds will win the game!"
    output_to_diplay('', msg, '', true)
    press_return_to_continue
  end

  def display_goodbye_message
    display_heading
    output_to_diplay('', "Thanks for playing, Good bye!", '')
  end

  def display_round
    display_heading
    human_name, computer_name, human_move, computer_move = round_details
    output_to_diplay('', "Round: #{current_round}", '')
    output_to_diplay(human_name, " ", computer_name)
    output_to_diplay(human_move, who_won, computer_move)
    computer.display_logic if computer.show_logic
    press_return_to_continue
  end

  def display_score
    display_heading
    human_score = "#{human.score}/#{rounds}"
    computer_score = "#{computer.score}/#{rounds}"
    output_to_diplay(human.name, "-- Current Score --", computer.name)
    output_to_diplay(human_score, " ", computer_score)
  end

  def display_game_winner
    display_heading
    game_winner = if human.score > computer.score
                    human
                  else
                    computer
                  end
    msg = "#{game_winner.name} won #{game_winner.score}"\
    " round(s) to win the game!"
    output_to_diplay('', msg, '')
  end

  def someone_won?
    human.score == rounds || computer.score == rounds
  end

  def play_game
    loop do
      choose_moves
      determine_winner
      display_round
      display_score
      move_history.add_round(winner)
      move_history.display
      break if someone_won?
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

RPSLSGame.new.play
