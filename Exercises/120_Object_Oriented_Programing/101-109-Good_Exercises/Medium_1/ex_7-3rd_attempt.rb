# ex_7.rb
# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# Example:

# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Understand the problem
# Create a method that can parse sentences and convert the words that are numbers into integers.

# Data
# I:string
# O:string
# A:array for numbers

# FURTHER EXPLORATION

# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.
#
# Can you change your solution this so the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

# Algorithm
# use regular expression to replace number words with digits, ignoring case
# use regular expression to remove spaces around single digits
# use regular expression to format phone numbers




p word_to_digit('Please call, me at five five five one two three four two three four. Thanks. Ignores existing numbers 50 500 one two three four five.')
