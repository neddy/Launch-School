# Write a method that takes two numbers. It should pront out all the primes between the two numbers. Don't use Ruby's `prime` class.
#
# Understand the problem
# take two numbers
# print out all numbers between two numbers that are prime
#
# Data
# I: 2 integers
# O: print out numbers
#
#
# Algorithm
# create range between two numbers
# select numbers in range that are prime
#   use prime method to determine which numbers are prime
# end
# print out selected numbers
#
#
# prime?
#   create range of numbers between 2 and number
#   iterate over range, and check if number is divisible by any number in range
#     return false if divisible
#   return true

def is_prime?(number)
  return false if number <= 1
  prime = true
  (2..number - 1).each do |n|
    prime = false if number % n == 0
  end
  prime
end


def print_primes(n1, n2)
  primes = (n1..n2).to_a
  primes.select! do |number|
    is_prime?(number)
  end
  puts primes.join(', ')
end

print_primes(1, 15)
print_primes(0, 1)
