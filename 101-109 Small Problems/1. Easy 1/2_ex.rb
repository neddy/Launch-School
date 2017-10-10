# 2_ex.rb
# Problem to solve:

# Write a method that takes one integer argument, which may be positive, negative, or zero. This method return true if the number's absolute value is odd. You may assume that the argument is a valid integer value.
# Examples:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true
#
# __ Understand the Problem __
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

# Take any interger value and return true if the ionterger is odd
#
#
#
#
# __ Examples / Test Cases __
# (Input / Output, Edge Cases? Bad input?)

# 1 == True
# 2 == False
# 5 == True
# -5 == True
# 0 == False
#
# Only need to deal with Intergers
#
# __ Data Structures __
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)

# Input => interger
# Output => Boolean
#
#
#
# __ Algorithm __
# (Create algorithm using language of chosen data structure)

# Get absolute value of integer
# is integer odd?
# Return boolean
#
#
# __ Abstraction __
# (Solve in 1-2 sentences, solve small problems)

# Get absolute value of integer input and test if it's odd, return boolean
#
#
#
#
#
# __ Code Below __

def is_odd (integer)
  integer.odd?
end

puts is_odd(5)
puts is_odd(0)
puts is_odd(2)
puts is_odd(-5)
