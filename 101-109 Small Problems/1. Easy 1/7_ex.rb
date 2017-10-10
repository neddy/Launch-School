# 7_ex.rb
# Problem to solve:

# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.
#
#
# __ Understand the Problem __
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

# Take an integer and return an integer of alternating 1's and 0's starting with a 1, with a lenght equal to the input integer

#
# __ Examples / Test Cases __
# (Input / Output, Edge Cases? Bad input?)

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
#
# __ Data Structures __
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)
#
# input integer
# Store ouput as string
#
#
# __ Algorithm __
# (Create algorithm using language of chosen data structure)
#
#
#
#
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

def stringy(num, start = 1)
  if start == 1
    string = '10'
    odd_addition = '1'
  else
    string = '01'
    odd_addition = '0'
  end

  if num.odd?
    return string * (num / 2) + odd_addition
  else
    return string * (num / 2)
  end
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'
