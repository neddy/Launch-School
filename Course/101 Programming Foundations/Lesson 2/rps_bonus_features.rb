# rps_type_along.rb

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

def prompt(message)
  puts "=> #{message}"
end

def player_choose
  choice = ''
  loop do
    prompt("Make your choice for this round:")
    VALID_CHOICES.each do |key, value|
      prompt(format("%-3s for: %s", key, value))
    end
    choice = gets.chomp
    break if VALID_CHOICES.key?(choice)
    prompt("That's not a valid choice.")
  end
  VALID_CHOICES[choice]
end

def computer_choose
  VALID_CHOICES.values.sample
end

def who_won(player, computer)
  if player == computer
    'tie'
  elsif WINNING_CHOICE[player].include?(computer)
    'player'
  else
    'computer'
  end
end

system('clear') || system('cls')
prompt('Welsome to Rock, Paper, Scissor, Spock, Lizzard!')
prompt('Good luck!')
loop do
  wins = { player: 0, computer: 0 }
  until wins[:player] == 5 || wins[:computer] == 5
    player_choice = player_choose()
    computer_choice = computer_choose()
    prompt("You chose: #{player_choice} Computer chose: #{computer_choice}")

    winner = who_won(player_choice, computer_choice)

    case winner
    when 'tie'
      prompt("It's a tie.")
    when 'player'
      wins[:player] += 1
      prompt('You won this round!')
    when 'computer'
      wins[:computer] += 1
      prompt('Computer won this round...')
    end

    prompt("Score: Player #{wins[:player]} Computer #{wins[:computer]}")
    prompt('Press return to continue.')
    gets
    system('clear') || system('cls')
  end

  prompt('--Game Over--')
  prompt("Final score: Player #{wins[:player]} Computer #{wins[:computer]}")
  if wins[:player] == 5
    prompt("You won 5 matches this game!")
  else
    prompt("The computer won 5 matches this game. Better luck next time.")
  end

  prompt("Would you like to play another match? Enter 'y' to continue,"\
    "anything else to quit.")
  continue = gets.chomp.downcase
  break unless continue == 'y'
  prompt('Good luck in the next match! Press return to start')
  gets
  system('clear') || system('cls')
end
prompt("Thanks for playing, good bye.")
