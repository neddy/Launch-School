# ex_6.rb
# # fizzbuzz
# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".
#
# Example:

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Understand the problem
# print out string of all numbers between two numbers
# replace numbers divisible by 3 with 'Fizz'
# replace numbers divisible by 5 with 'Buzz'
# replace numbers divisible by both 3 and 5 with 'FizzBuzz'
# seperate each element with ', '
#
# Data Structure
# I: two integers
# O: print string to screen
# A: store numbers, or their replacements in an array internally
#
# Algorithm
#
# Create array of numbers between two numbers
# iterate through numbers in array
#   if divisible by both 3 and 5 replace with 'FizzBuzz'
#   if divisible by 3 replace with 'Fizz'
#   if divisible by 5 replave with 'Buzz'
# create string with elements seperated by ', '
# print out string

def fizzbuzz(n1, n2)
  array = (n1..n2).to_a
  array.map! do |n|
    if n % 3 == 0 && n % 5 == 0
      'FizzBuzz'
    elsif n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    else
      n
    end
  end
  string = array.join(', ')
  puts string
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
