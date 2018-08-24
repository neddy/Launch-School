# ex_2.rb
# Rotation (Part 2)
# Write a method that can rotate the last n digits of a number. For example:

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
# Note that rotating just 1 digit results in the original number being returned.
#
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
#
# You may assume that n is always a positive integer.

# Understand the problem
# Take two numbers, the first being the number to rotate,
# and the second being how many digits to be included in the rotation(starting from the right)
#
# Data
# I: 2 x integers
# O: integer (rotated)
#
# Solution
# Split the first number into characters
# Take n number of characters and rotate them (n is the second integer passed to the method)
# join the rotated array back to the original, then join the digits back together and return as a number

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# My solution
def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  digits += rotate_array(digits.pop(n))
  digits.join.to_i
end

# LS Solution
def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

p rotate_rightmost_digits(735291, 2)
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
