# ex_10.rb
# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.
#
# Examples:

# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150
#
# Understand the problem
# take an integer, n
# calculate the sum of numbers from 1 to n, then square them
# calculate the sum of squares from 1 to n
# return the difference of the first less the second
#
# Data
# I: integer
# O: integer
#
# Solution
# As above


def sum_square_difference(n)
  ((1..n).reduce(:+)**2) - (1..n).reduce{ |sum, i| sum + i**2 }
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

def sum_square_difference(n)
  (((1..n).sum)**2) - (1..n).sum{ |i| i**2 }
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
