# ex_6.rb
# Build Tower
# Build Tower by the following given argument:
# number of floors (integer and always greater than 0).
#
# Tower block is represented as *
#
# Python: return a list;
# JavaScript: returns an Array;
# C#: returns a string[];
# PHP: returns an array;
# C++: returns a vector<string>;
# Haskell: returns a [String];
# Ruby: returns an Array;
# Have fun!
#
# for example, a tower of 3 floors looks like below
#
# [
#   '  *  ',
#   ' *** ',
#   '*****'
# ]
# and a tower of 6 floors looks like below
#
# [
#   '     *     ',
#   '    ***    ',
#   '   *****   ',
#   '  *******  ',
#   ' ********* ',
#   '***********'
# ]
#
# Understand the problem
# Create a tower n floors high, with the '*' for each floor. Each floor, the count of '*' increases by 2, and is always an odd count.
#
# Data
# I: integer
# O: array of floors
#
# Solution
# Create an array of numbers, starting at 1 and increasing by two each step.
# Then convert each element to that number of '*', padded by spaces, where the total padded size will the the last number in the array

# First Solution
def towerBuilder(n_floors)
  tower = []
  count = 1
  n_floors.times do |floor|
    tower[floor] = count
    count += 2
  end
  tower.map { |floor| "#{'*' * floor}".center(tower.last) }
end

# Second Solution
def towerBuilder(n_floors)
  tower = (1..n_floors*2-1).step(2).to_a
  tower.map { |floor| "#{'*' * floor}".center(tower.last) }
end

p towerBuilder(1)
p towerBuilder(2)
p towerBuilder(3)
