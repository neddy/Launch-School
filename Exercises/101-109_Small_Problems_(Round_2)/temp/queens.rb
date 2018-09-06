# queens.rb
# In the game of chess, a queen can attack peices which are on the same row, column, or diagonal.

# If white queen is at (2, 3) and black queen is at (5, 6), like this:

board = "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ W _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ B _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"

# You should also be able to tell if they can attach each other, in this case they can.


# # Understand the Problem
# - Take notes on the Problem
# - Make requirements and implicit knowledge explicit
# - Input / Output
#   - What are they? What will they look like?
#
# This problem requires the program to solve the problem of accepting an input of a
# string depicting a chess board with a white and black queen, determining if they can
# attact each other, returning a boolean value of true or false.
#
# Input: string with underscores, W anb B denoting. Spaces deviding characters, and new lines dividing rows.
# Output will be a boolean returned by the function, with true indicating they can attack, and false if they cannot.


#
# # Test Cases / Examples
# - Build tests
# - Define edge cases
# - Failures / Bad input - how to treat them?
# - Ask questions to verify understanding of problem / expected output.
#

#
# # Data Structures
# - Decide what type of data structure will suit the problem
# - Use a structure to make the algorithm simpler
# - Understand the methods associated with different data structures
#
# The string will be split into an array of arrays, with rows contained in the first layer, and then individual places contained within each row.
#

#
# # The Algorithm / Abstraction
# - Use language that fits with the chosen data structure
# - Be specific
# - Don't solve big problems, break it down into smaller problems if needed
# - Use 1-2 sentences to solve problems
# - Use abstraction and push details to methods/functions

# First split the string into an array of strings for each row.
# Next split each string into individual places within the first array, creating the nested array.
# Next, loop through the arrays and locate the queens, recording the coordinates in two element arrays.
# Test test the following:
# are the queens in the same row?
# Are the queens in the same column?
# Are the queens in the same diagonal?
#   Determine this by testing if the difference in rows apart is equal to the columns apart.
#
# If any of the above 3 test are true, return true, otherwise return false.





# Tests

board1 = "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ W _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ B _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"


board2 = "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ W _ _ B _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"


board3 = "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ W _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ B _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"


board4 = "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ W _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ B _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"\
        "_ _ _ _ _ _ _ _ \n"

board5 = "W _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ _ \n"\
         "_ _ _ _ _ _ _ B \n"

 board6 = "_ _ _ _ _ _ _ W \n"\
          "_ _ _ _ _ _ _ _ \n"\
          "_ _ _ _ _ _ _ _ \n"\
          "_ _ _ _ _ _ _ _ \n"\
          "_ _ _ _ _ _ _ _ \n"\
          "_ _ _ _ _ _ _ _ \n"\
          "_ _ _ _ _ _ _ _ \n"\
          "B _ _ _ _ _ _ _ \n"


def queen_attack?(board)
  board_array = board.split("\n")
  board_array.map! do |row|
    row.split(' ')
  end

  white = []
  black = []

  board_array.each_with_index do |row, row_idx|
    row.each_with_index do |char, col_idx|
      if char == "W"
        white = [row_idx, col_idx]
      elsif char == "B"
        black = [row_idx, col_idx]
      end
    end
  end

  attack_present = if white[0] == black[0]
    "row"
  elsif white[1] == black[1]
    "col"
  elsif (white[0] - black[0]).abs == (white[1] - black[1]).abs
    "diagonal"
  end
  attack_vectors = %w(row col diagonal)
  attack_vectors.include?(attack_present) ? true : false
end

p queen_attack?(board4)

p queen_attack?(board1) == true
p queen_attack?(board2) == true
p queen_attack?(board3) == true
p queen_attack?(board4) == false
p queen_attack?(board5) == true
p queen_attack?(board6) == true
