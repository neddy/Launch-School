# ex_10.rb
# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Understand the problem
# take an integer
# calcualte the square of the sum of numbers from 1 to the integer
# calcualte the sum of hte squares of the numbers from 1 to the integer
# return the difference between the two
#
# Data
# I: integer
# O: integer
#
# Algorithm
# create array of numbers from 1 to n
# square_of_sum = square of the sum of elements in array
# sum_of_squares = sum of the squares of elements in array
# return square_of_sum - sum_of_squares


def sum_square_difference(n)
  array = (1..n).to_a
  square_of_sum = array.reduce(:+)**2
  sum_of_squares = array.reduce(0){ |squares, el| squares + el**2 }
  square_of_sum - sum_of_squares
end

p sum_square_difference(3)
p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
