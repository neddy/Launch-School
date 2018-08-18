# Write a method that takes a string, and returns a boolean indicating whether this string has a balanced set of parentheses.
#
# Understand the problem
# take a string, and find if the parentheses are balanced.
# Return true if they are, otherwise false
#
# Data
# I:string
# O:Boolean
#
#
# Algorithm
# Remove non parentheses characters from string
# parentheses_count = 0
# iterate over string
#   add one to string for each open parentheses
#   subtract one for every close parentheses
#   return false if parentheses_count < 0
# end
# return true if parentheses_count == 0, otherwise false

def balanced(string)
  string.gsub!(/[^()]/, '')
  parentheses_count = 0
  string.chars.each do |char|
    if char == '('
      parentheses_count += 1
    else
      parentheses_count -= 1
    end
    return false if parentheses_count < 0
  end
  parentheses_count == 0 ? true : false
end


p balanced('Hi') == true
p balanced('(Hi') == false
p balanced('(hi)') == true
p balanced(')hi(') == false
