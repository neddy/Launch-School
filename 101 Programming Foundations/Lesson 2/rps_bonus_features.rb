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
    prompt("Choose one:")
    VALID_CHOICES.each do |key, value|
      prompt(format("%-3s for: %s", key, value))
    end
    choice = gets.chomp
    if VALID_CHOICES.key?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  VALID_CHOICES[choice]
end

def computer_choose
  VALID_CHOICES[VALID_CHOICES.keys.sample]
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

wins = { player: 0, computer: 0 }

while (wins[:player] < 5) && (wins[:computer] < 5)
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
  puts
end

prompt('--Game Over--')
if wins[:player] == 5
  prompt("You won 5 matches this game!")
else
  prompt("The computer won 5 matches this game. Better luck next time.")
end
