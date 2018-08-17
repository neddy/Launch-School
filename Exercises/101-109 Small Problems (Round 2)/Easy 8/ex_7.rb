# ex_7.rb
# Double Char (Part 1)
# Write a method that takes a string, and returns a new string in which every character is doubled.
#
# Examples:

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

## Understand the problem
# take a string, split up the string, double all the characters, join it back together and return the string.
# Return an emply string if an empty string is supplied

## Data
# I: string
# O: string
# A: store split string of chars in array

## Algorithm
# split string into array of characters
# iterate over array, double all characters
# Join array back together and return string

def repeater(string)
  array = string.split('')
  array.map! do |char|
    char * 2
  end
  array.join
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
