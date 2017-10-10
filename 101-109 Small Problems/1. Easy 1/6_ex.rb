# 6_ex.rb
# Problem to solve:

# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.
#
# __ Understand the Problem __
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

# Return words in string with letter reversed if the word has 5 or more chars, words in same order
#
#
#
# __ Examples / Test Cases __
# (Input / Output, Edge Cases? Bad input?)
#
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS
#
#
#
# __ Data Structures __
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)

# Array
#
#
#
# __ Algorithm __
# (Create algorithm using language of chosen data structure)

# Take string and split in to array
# Reverse letters in each element of array if element comntains more that 5 chars
# join array elements and return string
#
# __ Abstraction __
# (Solve in 1-2 sentences, solve small problems)
#
#
#
#
#
#
# __ Code Below __

def reverse_words(string)
  arr_of_words = string.split
  arr_of_words.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  arr_of_words.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Tests
puts reverse_words('Professional') == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School') == 'hcnuaL loohcS'
