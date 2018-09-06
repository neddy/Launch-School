# Write a method that will generate random english math problem problems. The method should take a length, then return a math phrase with that many operation.
#
# Examples
#
# mathphrase(1) #=> "five minus two"
# mathphrase(2) #=> "five minus two times eight"
# mathphrase(3) #=> "five minus two times eight plus four"
#
# Given:
# NUMBERS = %w(zero one two three four five six seven eight nine ten)
# OPERATORS = %w(plus minus times divided)

# Understand the problem
# take an integer as input, then return a string with a math problem, with the number of operations equal to integer input
#
# Data
# I: integer
# O: string
#
# Algorithm
# initialise an empty array
# add one number to array to begin with
# loop the input integer number of times
#   add an operation and a number to the array each iteration
# end loop
#
# join the array and return the string



NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(n)
  calculation_elements = []
  calculation_elements << NUMBERS.sample
  n.times do
    calculation_elements << OPERATORS.sample
    calculation_elements << NUMBERS.sample
  end
  calculation_elements.join(' ').gsub('divided', 'divided by')
end


p mathphrase(1) #=> "five minus two"
p mathphrase(2) #=> "five minus two times eight"
p mathphrase(3) #=> "five minus two times eight plus four"

def random_length
  n = (1..20).to_a.sample
  mathphrase(n)
end

p random_length
