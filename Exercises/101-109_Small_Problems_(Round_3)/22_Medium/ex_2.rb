# ex_2.rb
# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:
#
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
#
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
#
# Examples:

# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true
#
# Understand the problem
# Take a word and return wether it can be spelled with the blocks. Each block can only be used once
#
# Data
# I: string
# O: boolean
# A: store blocks in array
#
# Solution
# create array of pairs
# loop through pairs
#   return false if the count for any pair is greater than 1 in the string
# end
# return true at end of method

BLOCKS = %w(bo xk dq cp na gt re fs jw hu vi ly zm)

def block_word?(word)
  BLOCKS.none?{ |block| word.downcase.count(block) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
