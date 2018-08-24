# ex_8.rb
# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

# Understand the problem
# Take an input n, and compute the nth fibonacci
# a fibonacci is the sum of the two previous fibonacci numbers, starting at with 1, 1
#
# Data
# I: integer
# O: integer
#
# Solution
# take n, then use recursion to add fibonacci numbers until you get to the nth number of recursion


def fibonacci(n, depth = 2, last_two = [1, 1])
  return last_two.last if n <= depth
  fibonacci(n, depth + 1, [last_two.last, last_two.sum])
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(8000)
