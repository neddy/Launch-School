# ex_2.rb
# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
#
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
#
# Examples:

BLOCK_LETTERS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  used_blocks = []
  word.chars.each do |char|
    index = BLOCK_LETTERS.find_index do |block|
      block.include?(char.upcase)
    end
    return false if used_blocks.include?(index)
    used_blocks << index
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?("boxdcngrfjhvlz")
