# Write a method that will determine whether an integer is a prime. Don't use the Prime class
#
# Understand the problem
# create a method that determines if a number is a prime number.
# What is a prime number?
#   a number that is only divisible by 1 and itself
#
# Data
# I: integer
# O: boolean
#
# Steps to solve problem
# create a range from 2 to the number - 1
# test if the number is divisible by any numbers in the range created above, if so, return false
# return true otherwise
#
# Algorithm
# CREATE RANGE(2..n - 1)
# ITERATE OVER range
#   RETURN false IF n % current_number == 0
# END ITERATION
# RETURN TRUE



def is_prime?(n)
  return false if n <= 1
  range = (2..n - 1).to_a
  range.each do |current_number|
    return false if n % current_number == 0
  end
  true
end

p is_prime?(3)
p is_prime?(4)

def primes(array)
  array.select { |n| is_prime?(n) }
end

p primes([1, 3, 4, 5, 6, 7, 9, 11, 12])
p primes([4])

def primes_count(array)
  primes(array).count
end

p primes_count([1, 3, 4, 5, 6, 7, 9, 11, 12])
