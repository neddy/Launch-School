# ex_8.rb
# Fibonacci Numbers (Recursion)
# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:
#
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
#
# Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself. For example:
#
# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
#
# sum is a recursive method that computes the sum of all integers between 1 and n.
#
# Recursive methods have three primary qualities:
#
# 1. They call themselves at least once.
# 2. They have a condition that stops the recursion (n == 1 above).
# 3. They use the result returned by themselves.
#
# In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.
#
# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
#
# This exercise is a lead-in for the next two exercises. It verges on the Advanced level, so don't worry or get discouraged if you can't do it on your own. Recursion is tricky, and even experienced developers can have trouble dealing with it.
#
# Examples:

# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765

# Understand the problem
# Write a method that uses recursion to calculate the nth fibonacci number

# Data
# I: integer
# O: integer
# A: array and integer

# Algorithm
# FN fib(n, count = 3, last = 1, second_last = 1)
#   Test if n is less than or equal to 2, return 1 if true
#   fib = first + second
#   return fib if count == n
#   last, second_last = fib, last
#   call fib(n, count + 1, last, second_last)


def fibonacci(n, count = 3, last = 1, second_last = 1)
  return 1 if n <= 2
  fib = last + second_last
  return fib if count == n
  last, second_last = fib, last
  fibonacci(n, count + 1, last, second_last)
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(8000)
