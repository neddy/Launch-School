# ex_9.rb
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# ANS

The `play` method in `Bingo` would override the `play` method in `Game` for `Bingo` objects.
