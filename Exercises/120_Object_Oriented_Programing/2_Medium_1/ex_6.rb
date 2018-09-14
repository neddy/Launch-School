# ex_6.rb
# Number Guesser Part 1
# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:
#
# game = GuessingGame.new
# game.play
#
# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!
#
# game.play
#
# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high
#
# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
#
# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
# You are out of guesses. You lose.
# Note that a game object should start a new game with a new number to guess with each call to #play.


class GuessingGame
  GUESS_LIMIT = 7
  NUMBERS_RANGE = 1..100

  def initialize
    @secret_number = nil
    @guesses = 0
    @current_guess = nil
  end

  def play
    reset
    loop do
      @current_guess = request_number
      @guesses += 1
      check_guess
      break if won? || no_guesses_left?
      display_guesses_left
    end
    display_result
  end

  private
  attr_accessor :guesses
  attr_reader :secret_number, :current_guess

  def request_number
    choice = ''
    loop do
      print "Please enter a number between 1 and 100: "
      choice = gets.chomp
      break if choice.to_i.to_s == choice && NUMBERS_RANGE.cover?(choice.to_i)
      puts "Invalid choice. "
    end
    choice.to_i
  end

  def reset
    @secret_number = rand(NUMBERS_RANGE)
    @guesses = 0
  end

  def check_guess
    if higher?
      diplsay_to_high
    elsif lower?
      diplsay_to_low
    end
  end

  def won?
    current_guess == secret_number
  end

  def guesses_left
    GUESS_LIMIT - guesses
  end

  def no_guesses_left?
    guesses_left == 0
  end

  def higher?
    current_guess > secret_number
  end

  def input_prompt
    print "=>"
  end

  def lower?
    current_guess < secret_number
  end

  def display_guesses_left
    puts
    puts "You have #{guesses_left} guesses remaining."
  end

  def display_result
    if won?
      puts "You win!"
    else
      puts "You ran out of guesses, better luck next time."
    end
  end

  def diplsay_to_high
    puts "Your guess is too high"
  end

  def diplsay_to_low
    puts "Your guess is too low"
  end
end

game = GuessingGame.new
game.play
game.play
