# rps_type_along.rb
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def player_won?(first_player, second_player)
  (first_player == 'rock' && second_player == 'scissors') ||
    (first_player == 'paper' && second_player == 'rock') ||
    (first_player == 'scissors' && second_player == 'paper')
end

def display_results(player, computer)
  if player_won?(player, computer)
    prompt('You won!')
  elsif player_won?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie.")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice} Computer chose: #{computer_choice}")
  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
