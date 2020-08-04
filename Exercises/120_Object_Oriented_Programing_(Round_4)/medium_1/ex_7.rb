# ex_7.rb


class GuessingGame
  def initialize(low, high)
    @low = low
    @high = high
    @game_range = (low..high)
    @guesses_allowed = Math.log2(high - low).to_i + 1
  end

  def play
    @secret_num = @game_range.to_a.sample
    outcome = user_guess

    if outcome == :won
      puts "\nYou won!"
    else
      puts "\nYou have no more guesses. You lost!"
    end
  end

  def user_guess
    outcome = :lost
    @guesses_allowed.downto(1) do |round|
      puts "You have #{round} guesses remaining."
      print "Enter a number between #{@low} and #{@high}: "
      guess = user_input

      if guess == @secret_num
        outcome = :won
        puts "That's the number!"
        break
      elsif guess > @secret_num
        puts "Your guess is too high."
      else
        puts "Your guess is too low."
      end
    end
    outcome
  end

  def user_input
    input = nil
    loop do
      user_input = gets.chomp
      if @game_range === user_input.to_i
        input = user_input.to_i
        break
      end
      print "Invalid guess. Enter a number between #{@low} and #{@high}: "
    end
    input
  end
end

game = GuessingGame.new(501, 1500)
game.play
