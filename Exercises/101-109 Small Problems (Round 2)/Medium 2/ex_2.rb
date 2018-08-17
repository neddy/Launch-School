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

# Understand the problem
# write a method that return true if a word can be spelt without resuing any blocks

# Data
# I:string
# O:boolean
# A: store blocks in a hash, with key as letters, and value as either 'used' or 'free'

# Algorithm
# split string into chars
# loop through chars
#   check if block has been used, return false if used
#   toggle block as used
# end loop
# return true


def block_word?(string)
  letter_groups = %w(bo xk dq cp na gt re fs jw hu vi ly zm)
  letter_groups.map! do |letters|
    [letters, 'free']
  end

  blocks = letter_groups.to_h
  
  string.chars.each do |char|
    blocks.keys.each do |letters|
      if letters.include?(char.downcase)
        return false if blocks[letters] == 'used'
        blocks[letters] = 'used'
      end
    end
  end
  true
end

p block_word?('BATCH')
p block_word?('BUTCH')
p block_word?('jest')

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true
