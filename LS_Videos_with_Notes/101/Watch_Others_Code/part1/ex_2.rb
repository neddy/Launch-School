# Write a program taht asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or the product of all the numbers between 1 and the entered integer.
#
# Understand the problem
# ask user for input of integer greater than 0
# then ask if user wants to calcualte the sum or product of the numbers between 1 and the number
#
#
# Data
# I: integer
# O: integer
#
# Solution
# Ask for a number
# Check if input is number
# ASk which procedure to run
# Check if input is valid
# Create range of 1 to n
#
# if user asked for the sum of numbers
#   add all numbers in range together
# else
#   calculate product of all numbers
# end
# return result
#
# Algorithm
# loop
#   ask for INTEGER
#   break if INTEGER is integer
# end loop
#
# loop
#   ask for PROCEDURE
#   break if PROCEDURE is either s or p
# end loop
#
# RANGE = 1..n as array
#
# if PROCEDURE == 's'
#   calculate sum of numbers in array
# else
#   calculate product of numbers in array
# end

def sum_or_product()
  n = 0
  procedure = ''
  loop do
    puts "Please enter a number greater than 0"
    response = gets.chomp
    n = response.to_i if response.to_i.to_s == response && response.to_i > 0
    break if n > 0
  end
  loop do
    puts "Please enter 's' if you would like to calculate the sum, or 'p' if you would like to calculate the product"
    response = gets.chomp
    procedure = response if %w(s p).include?(response)
    break unless procedure.empty?
  end

  range = (1..n).to_a
  if procedure == 's'
    range.reduce(:+)
  else
    range.reduce(:*)
  end
end

p sum_or_product

# input 3 and sum == 6
# input 3 and product == 6
# input 4 and product == 24
