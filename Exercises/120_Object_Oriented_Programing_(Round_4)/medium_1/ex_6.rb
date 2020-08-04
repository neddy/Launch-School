# ex_6.rb

class GuessingGame
  # def initialize
  #
  # end

  def play
    @secret_num = (1..100).to_a.sample
    outcome = user_guess

    if outcome == :won
      puts "\nYou won!"
    else
      puts "\nYou have no more guesses. You lost!"
    end
  end

  def user_guess
    outcome = :lost
    7.times do
      print "Enter a number between 1 and 100: "
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
      if (1..100) === user_input.to_i
        input = user_input.to_i
        break
      end
      print "Invalid guess. Enter a number between 1 and 100: "
    end
    input
  end
end


game = GuessingGame.new
game.play
