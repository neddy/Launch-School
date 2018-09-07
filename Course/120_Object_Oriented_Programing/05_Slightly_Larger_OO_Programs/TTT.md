## Assignment: OO Tic Tac Toe

1. Write a description of the problem and extract major nouns and verbs.
2. Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
3. Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

Tic Tac Toe is a game with two players, they each take turns placing a knot or a cross in a square on a board. The first one to get three in a row wins.

Nouns
- Players
- square
- board

Verbs
- Mark - placing (knot or cross)


```ruby
class Player
  def initialize
  # Name
  # Which Mark
  # 
  end
end

class Square
  def initialize
    # Knot or Cross
  end
end

class Board
  def initialize
    # Create blank 3 x 3 grid
    # Array of 3 Arrays
  end

end

class TTTGame
  def play
      display_welcome_message
      create_players
      loop do
        display_board
        first_player_moves
        break if someone_won? || board_full?
        
        second_player_moves
        break if someone_won? || board_full?
      end
      display_result
      display_good_bye
  end
end
```
