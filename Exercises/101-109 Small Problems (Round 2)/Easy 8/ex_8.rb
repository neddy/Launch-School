# ex_8.rb
# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.
#
# Examples:

# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

## Understand the problem
# take a string, split up the string, double all constant characters, join it back together and return the string.
# ignore all other characters
# Return an emply string if an empty string is supplied


## Data
# I: string
# O: string
# A: store split string of chars in array

## Algorithm
# split string into array of characters
# iterate over array, double  character if constant
# Join array back together and return string

def double_consonants(string)
  constants = ('a'..'z').to_a.join.gsub(/[aeiou]/, '')
  array = string.split('')
  array.map! do |char|
    if constants.include?(char.downcase)
      char * 2
    else
      char
    end
  end
  array.join
end

p double_consonants('String')

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
