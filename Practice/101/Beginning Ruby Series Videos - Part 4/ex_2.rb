# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Examples:
# fizzbuzz(1, 15) == output: 1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz'

# Understand the problem
# Take two numbers, the starting and ending number. Print out all the numbers between the two numbers, including the starting and  ending number. In the print out, replace the numbers with words if they meet certian conditions.

# Conditions
# replace the number with:
# 'FizzBuzz' if it is divisible by both 3 and 5
# 'Fizz' if it is divisible by 3
# 'Buzz' if divisible by 5

# Data
# I: two integers
# O: Print to screen
# A: store data in array


# Algorithm
# create array of numbers between starting and ending number
# iterate over array, transforming values
#   if element divisible by 3 and 5
#     'FizzBuzz'
#   else if element divisible by 3
#     'Fizz'
#   else if element divisible by 5
#     'Buzz'
#   else
#     element
#   end
# end iteration
#
# Join elements of array wiht ', ' and print out.


def fizzbuzz(n1, n2)
  array = (n1..n2).to_a
  array.map! do |el|
    case
    when el % 5 == 0 && el % 3 == 0
      'FizzBuzz'
    when el % 3 == 0
      'Fizz'
    when el % 5 == 0
      'Buzz'
    else
      el
    end
  end
  puts array.join(', ')
end

fizzbuzz(1, 15) # == output: 1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz'
