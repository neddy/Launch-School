# ex_7.rb
# In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:
#
# Math.log2(size_of_range).to_i + 1


class GuessingGame
  def initialize(low, high)
    @low_number = low
    @high_number = high
    @guess_limit = determine_guess_limit
    @numbers_range = low_number..high_number
    @secret_number = nil
    @guesses = 0
    @current_guess = nil
  end

  def play
    reset
    loop do
      display_guesses_left
      @current_guess = request_guess
      @guesses += 1
      check_guess
      break if won? || no_guesses_left?
    end
    display_result
  end

  private
  attr_accessor :guesses
  attr_reader :secret_number, :current_guess, :low_number, :high_number
  attr_reader :guess_limit, :numbers_range

  def request_guess
    choice = ''
    loop do
      print "Please enter a number between #{low_number} and #{high_number}: "
      choice = gets.chomp
      break if choice.to_i.to_s == choice && numbers_range.cover?(choice.to_i)
      puts "Invalid choice. "
    end
    choice.to_i
  end

  def determine_guess_limit
    Math.log2(high_number - low_number).to_i + 1
  end

  def reset
    @secret_number = rand(numbers_range)
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
    guess_limit - guesses
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
    puts
  end

  def diplsay_to_low
    puts "Your guess is too low"
    puts
  end
end

game = GuessingGame.new(501, 1500)
game.play
game.play
