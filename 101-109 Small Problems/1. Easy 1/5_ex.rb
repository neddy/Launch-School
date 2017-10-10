# 5_ex.rb
# Problem to solve:

# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.
# Examples
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# __ Understand the Problem __
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

# Take a string and reverse the order of the words, but not the letters in the words
#
#
#
#
# __ Examples / Test Cases __
# (Input / Output, Edge Cases? Bad input?)

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
#
# How should periods be treated?
#
# __ Data Structures __
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)

# Input to Array
#
#
#
# __ Algorithm __
# (Create algorithm using language of chosen data structure)

# Take input string
# Split words into array
# Reverse order of array
# Convert back to string and return

# __ Abstraction __
# (Solve in 1-2 sentences, solve small problems)

# Take a string, convert it to an array, reverse the array and then convert it back to a string and return it.
#
#
#
#
#
# __ Code Below __

def reverse_sentence(string)
  arr_of_words = string.split
  arr_of_words.reverse!
  words_in_reverse = arr_of_words.join(" ")
  words_in_reverse
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
