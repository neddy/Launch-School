# rps_game.rb
require 'pry'

module RPSHelpers
  def clear_screen
    system('clear') || system('cls')
  end

  def prompt_input
    print "=> "
  end

  def press_return_to_continue
    puts
    puts 'Press return to continue.'
    gets
    clear_screen
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

# class HumanMovesHistory
#   attr_accessor :value
#   def initialize(move_history)
#     set_human_history(move_history)
#     # @value = move_history.last_two_human_moves
#   end
#
#   def set_human_history(move_history)
#     previous_moves = move_history.human_moves.map(&:to_s)
#     outcome = move_history.winners.map do |winner|
#                 if winner == move_history.human.name
#                   'won'
#                 elsif winner == move_history.computer.name
#                   'lost'
#                 else
#                   'tie'
#                 end
#               end
#     @value = previous_moves.zip(outcome).reverse
#   end
#
#   def won_last_two?
#     return false if value.size <= 1
#     value[0][1] == 'won' && value[1][1] == 'won'
#   end
#
#   def won_last?
#     value[0][1] == 'won'
#   end
#
#   def lost_last?
#     value[0][1] == 'lost'
#   end
#
#   def tie_last?
#     value[0][1] == 'tie'
#   end
#
#   def last_move
#     value[0][0]
#   end
# end

class MoveHistory
  include RPSHelpers
  attr_accessor :human_moves, :computer_moves, :winners, :human, :computer
  # attr_accessor :human_name, :computer_name

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
    display_score
    puts "\n\n"
    display_past_rounds
    press_return_to_continue
  end

  def display_past_rounds
    rounds = human_moves.size
    puts "-- Past Rounds --".center(48)
    puts format(" Round | %-12s | %-12s | Winner", human.name, computer.name)
    puts "-" * 48
    rounds.times do |idx|
      hm = human_moves[idx]
      cm = computer_moves[idx]
      winner = winners[idx]
      puts format("   %-2s  | %-12s | %-12s | %-8s", idx + 1, hm, cm, winner)
    end
  end

  def display_score
    hn = human.name
    hs = human.score
    cn = computer.name
    cs = computer.score
    puts "-- Current Score --".center(48)
    puts format("      %-12s: %-2s  %-12s: %-2s", hn, hs, cn, cs)
  end

  def human_same_move?(n)
    return false unless human_moves.size >= n
    human_move.last(n).uniq == 1
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
    n = ''
    loop do
      puts "What is your name?"
      prompt_input
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter your name."
    end
    self.name = n
    clear_screen
  end

  def choose
    choice = nil
    valid_choices = Move::VALID_CHOICES
    loop do
      puts "Make your choice for this round:"
      valid_choices.each do |key, value|
        puts format("%-3s for:  %s", key, value)
      end
      prompt_input
      choice = gets.chomp
      break if valid_choices.keys.include?(choice)
      clear_screen
      puts "Sorry, invalid choice.\n"
    end
    self.move = Move.new(valid_choices[choice])
    clear_screen
  end
end

class Computer < Player
  attr_accessor :weighted_choices, :superior_moves

  SUPERIOR_MOVES = {
    "rock"=>["paper", "spock"],
    "paper"=>["scissors", "lizard"],
    "scissors"=>["rock", "spock"],
    "lizard"=>["rock", "scissors"],
    "spock"=>["paper", "lizard"]
  }

  def initialize
    super
    reset_weighted_choices
  end

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

  def determine_counter_moves(expected_mvs)
    counter_mvs_hsh = SUPERIOR_MOVES.select do |mv, _|
                        expected_mvs[0] == mv || expected_mvs[1] == mv
                      end
    counter_mvs = counter_mvs_hsh.values.flatten.uniq
    counter_mvs.reject do |mv|
      expected_mvs.any? { |e_mv| Move::INFERIOR_MOVES[e_mv].include?(mv) }
    end
  end

  def determine_expected_moves(move_history)
    last_move = move_history.human_last_move
    next_move = select_next_move(last_move)
    case
    when move_history.human_won_last?(2) && move_history.human_same_move?(2)
      # Player May move to next move, or keep last move
      # I would like to raise teh posibility of moving to the next move if player wins more in a row. Need to add move cases here with new methods in history.
      [next_move, last_move]
    when move_history.human_won_last?
      # Player is expected to keep current move
      [last_move]
    when move_history.human_lost_last?
      # Player is expected to move to next move
      [next_move]
    else # tie
      # Player May move to next move, or keep last move
      [next_move, last_move]
    end
  end

  def change_weights(counter_moves, superior_mv_weight, inferior_mv_weight)
    self.weighted_choices = weighted_choices.map do |mv, weight|
                              if counter_moves.any? { |c_mv| c_mv == mv } #
                                [mv, superior_mv_weight]
                              else
                                [mv, inferior_mv_weight]
                              end
                            end.to_h
  end

  def adjust_probabilities(move_history)
    expected_moves = determine_expected_moves(move_history)
    counter_moves = determine_counter_moves(expected_moves)
    case counter_moves.size
    when 2
      change_weights(counter_moves, 0.47, 0.02)
    when 1
      change_weights(counter_moves, 0.92, 0.02)
    else
      reset_weighted_choices
    end
  end

  def display_counter_plan
    p @weighted_choices
    # Method to show what computer is doing...
  end

  def choose(move_history)
    adjust_probabilities(move_history) unless move_history.human_moves.empty?
    choice = @weighted_choices.max_by do |_, weight|
      rand**(1.0 / weight)
    end
    self.move = Move.new(choice.first)
    display_counter_plan # Add conditional here...
  end
end

class RPSGame
  include RPSHelpers
  attr_accessor :human, :computer, :winner, :rounds, :move_history

  def initialize
    @human = Human.new
    @computer = Computer.new
    set_round_limit
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
  end

  def choose_moves
    human.choose
    computer.choose(move_history)
  end

  def set_round_limit
    choice = nil
    loop do
      puts "How many rounds would you like to play to this game?"
      prompt_input
      choice = gets.chomp
      break if choice.to_i.to_s == choice
      clear_screen
      puts "Sorry, please entere a valid number."
      puts
    end
    self.rounds = choice.to_i
    clear_screen
  end

  def display_welcome_message
    puts "Hi #{human.name}, welcome to Rock, Paper, Scissors, Lizard and Spock!"
  end

  def display_game_start
    puts "This game you will be playing against #{computer.name}."
    puts "The first to win #{rounds} rounds will the game!"
    press_return_to_continue
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard and Spock! Good bye!"
  end

  def display_round
    puts
    puts format("%-10s chose: %-8s ", human.name, human.move)
    puts format("%-10s chose: %-8s ", computer.name, computer.move)
    puts
    if winner == human
      puts "#{human.name} won!"
    elsif winner == computer
      puts "#{computer.name} won!"
    else
      puts "Its's a tie!"
    end
    press_return_to_continue
  end

  def display_game_winner
    if human.score > computer.score
      puts "#{human.name} won #{rounds} rounds to win the game!"
    else
      puts "#{computer.name} won #{rounds} rounds to win the game!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y,n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "please enter a 'y' or 'n'"
    end
    clear_screen
    answer == 'y' ? true : false
  end

  def reset_game
    human.reset
    self.computer = Computer.new
    set_round_limit
  end

  def reset_winner
    self.winner = nil
  end

  def play_game
    self.move_history = MoveHistory.new(human, computer)
    loop do
      choose_moves
      determine_winner
      display_round
      add_to_score if winner
      move_history.add_round(winner)
      move_history.display
      break if human.score == rounds || computer.score == rounds
      reset_winner
    end
  end

  def play
    display_welcome_message
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
