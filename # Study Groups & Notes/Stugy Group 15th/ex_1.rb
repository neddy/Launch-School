# 109 study group

# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example, solve(["abode","ABc","xyzD"]) == [4,3,1].

# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

# p solve(["abode","ABc","xyzD"]) == [4,3,1]

# Understand the problem
# Take a string and see how many characters in the string ocupy the same position in the alphabet
#
# Data
# I: array of string
# O: Integer
#
# Algorithm
#
# Create array of alphabet
# iterate over strings
#   split each string into characters, iterate over with index
#     test if each char is equal to char in alphabet
#   end
# end

def solve(array)
  aplhabet = ('a'..'z').to_a
  array.map do |string|
    count = 0
    string.chars.each_with_index do |char, idx|
      count += 1 if char.downcase == aplhabet[idx]
    end
    count
  end
end

p solve(["abode","ABc","xyzD"])
p solve(["abode","ABc","xyzD"]) == [4,3,1]
