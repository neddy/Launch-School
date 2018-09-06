# ex_10.rb
# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.
#
# Examples:

def sum_square_difference(number)
  sum_square = (1..number).reduce(:+) ** 2
  sqaure_sum = (1..number).reduce { |sum, i| sum + i ** 2 }
  sum_square - sqaure_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
