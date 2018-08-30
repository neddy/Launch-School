# rps_game.rb
require 'pry'

module RPSHelpers
  def clear_screen
    system('clear') || system('cls')
  end
end

class Move
  attr_reader :value
  VALID_CHOICES = {
    'r' => 'rock',
    'p' => 'paper',
    'sc' => 'scissors',
    'sp' => 'spock',
    'l' => 'lizard'
  }

  WINNING_CHOICE = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'spock' => ['scissors', 'rock'],
    'lizard' => ['spock', 'paper']
  }
  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_CHOICE[@value].include?(other_move.value)
  end

  def <(other_move)
    !(WINNING_CHOICE[@value].include?(other_move.value)) &&
    @value != other_move.value
  end

  def to_s
    @value
  end
end

class Player
  include RPSHelpers
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    @score = 0
    @move_history = []
  end
  def reset
    @score = 0
    @move_history = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter your name."
    end
    self.name = n
    clear_screen
  end

  def choose
    choice = nil
    loop do
      puts "Make your choice for this round:"
      Move::VALID_CHOICES.each do |key, value|
        puts format("%-3s for: %s", key, value)
      end
      choice = gets.chomp
      break if Move::VALID_CHOICES.keys.include?(choice)
      clear_screen
      puts "Sorry, invalid choice."
      puts
    end
    self.move = Move.new(Move::VALID_CHOICES[choice])
    clear_screen
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Chappie', 'Hal'].sample
  end

  def choose
    self.move = Move.new(Move::VALID_CHOICES.values.sample)
  end
end

class RPSGame
  include RPSHelpers
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def keep_score
    self.winner.score += 1
  end

  def add_moves_to_history
    human.move_history << human.move
    computer.move_history << computer.move
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard and Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard and Spock! Good bye!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_score
    puts
    puts "#{human.name} Score #{human.score} \
    #{computer.name} Score #{computer.score}"
    puts 'Press return to continue.'
    gets
    clear_screen
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      self.winner = human
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      self.winner = computer
    else
      puts "Its's a tie!"
    end
  end

  def display_history
    rounds = human.move_history.size
    puts format("Round| %-8s %-8s", human.name, computer.name)
    puts "-" * 24
    rounds.times do |idx|
      hm = human.move_history[idx]
      cm = computer.move_history[idx]
      puts format("  %-2s | %-8s %-8s", idx + 1, hm, cm)
    end
    puts 'Press return to continue.'
    gets
    clear_screen
  end

  def display_game_winner
    if human.score > computer.score
      puts "#{human.name} won 3 rounds to win the game!"
    else
      puts "#{computer.name} won 3 rounds to win the game!"
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
    computer.reset
  end
  def reset_winner
    self.winner = nil
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_round_winner
        keep_score if winner
        display_score
        add_moves_to_history
        display_history
        break if human.score == 3 || computer.score == 3
        reset_winner
      end
      display_game_winner
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end
end

RPSGame.new.play
