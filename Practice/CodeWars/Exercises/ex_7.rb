# ex_7.rb
#Sudoku Background
# Sudoku is a game played on a 9x9 grid. The goal of the game is to fill all cells of the grid with digits from 1 to 9, so that each column, each row, and each of the nine 3x3 sub-grids (also known as blocks) contain all of the digits from 1 to 9.
# (More info at: http://en.wikipedia.org/wiki/Sudoku)
#
# Sudoku Solution Validator
# Write a function validSolution/ValidateSolution/valid_solution() that accepts a 2D array representing a Sudoku board, and returns true if it is a valid solution, or false otherwise. The cells of the sudoku board may also contain 0's, which will represent empty cells. Boards containing one or more zeroes are considered to be invalid solutions.
#
# The board is always 9 cells by 9 cells, and every cell only contains integers from 0 to 9.
#
# Examples
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2],
#   [6, 7, 2, 1, 9, 5, 3, 4, 8],
#   [1, 9, 8, 3, 4, 2, 5, 6, 7],
#   [8, 5, 9, 7, 6, 1, 4, 2, 3],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 6, 1, 5, 3, 7, 2, 8, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 4, 5, 2, 8, 6, 1, 7, 9]
# ]); // => true
# validSolution([
#   [5, 3, 4, 6, 7, 8, 9, 1, 2],
#   [6, 7, 2, 1, 9, 0, 3, 4, 8],
#   [1, 0, 0, 3, 4, 2, 5, 6, 0],
#   [8, 5, 9, 7, 6, 1, 0, 2, 0],
#   [4, 2, 6, 8, 5, 3, 7, 9, 1],
#   [7, 1, 3, 9, 2, 4, 8, 5, 6],
#   [9, 0, 1, 5, 3, 7, 2, 1, 4],
#   [2, 8, 7, 4, 1, 9, 6, 3, 5],
#   [3, 0, 0, 4, 8, 1, 1, 7, 9]
# ]); // => false

require 'pry'
def validSolution(board)
  return false if board.count{ |row| row.include?(0) } > 1
  count_false = { row: 0, col: 0, grid: 0 }
  count_false[:row] = board.count{ |row| row.uniq != row }
  count_false[:col] = board.transpose.count{ |col| col.uniq != col }
  grids_3x3 = Array.new(9){ |_| [] }
  (0..6).step(3).each do |idx|
    3.times do |row|
      grids_3x3[idx] += board[row + idx][0, 3]
      grids_3x3[idx + 1] += board[row + idx][3, 3]
      grids_3x3[idx + 2] += board[row + idx][6, 3]
    end
  end
  count_false[:grid] = grids_3x3.count{ |block| block.uniq != block }
  count_false.values.sum == 0
end

p validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
                 [6, 7, 2, 1, 9, 5, 3, 4, 8],
                 [1, 9, 8, 3, 4, 2, 5, 6, 7],
                 [8, 5, 9, 7, 6, 1, 4, 2, 3],
                 [4, 2, 6, 8, 5, 3, 7, 9, 1],
                 [7, 1, 3, 9, 2, 4, 8, 5, 6],
                 [9, 6, 1, 5, 3, 7, 2, 8, 4],
                 [2, 8, 7, 4, 1, 9, 6, 3, 5],
                 [3, 4, 5, 2, 8, 6, 1, 7, 9]])

p validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
                 [6, 7, 2, 1, 9, 0, 3, 4, 9],
                 [1, 0, 0, 3, 4, 2, 5, 6, 0],
                 [8, 5, 9, 7, 6, 1, 0, 2, 0],
                 [4, 2, 6, 8, 5, 3, 7, 9, 1],
                 [7, 1, 3, 9, 2, 4, 8, 5, 6],
                 [9, 0, 1, 5, 3, 7, 2, 1, 4],
                 [2, 8, 7, 4, 1, 9, 6, 3, 5],
                 [3, 0, 0, 4, 8, 1, 1, 7, 9]]) == false


# This one was a little hard, it was not easy finding the 3x3 grids of numbers.
