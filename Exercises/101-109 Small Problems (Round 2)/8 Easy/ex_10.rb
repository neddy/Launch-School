# ex_10.rb
# Get The Middle Character
# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.
#
# Examples:

# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

# Understand the problem
# return the middle one or two charcters of a string
# return two characters if the string is an even length
# otherwise retrun 1
# supplied string will not be empty

# Data
# I:string
# O:string
# A:string

# Algorithm
# find middle index number by dividing string length by 2
# if string is odd length, return charcter at index above
# if string is even length, return string 2 characters long from the middle index minus one

def center_of(string)
  middle = string.size / 2
  if string.size.odd?
    string[middle]
  else
    string[middle - 1, 2]
  end
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
