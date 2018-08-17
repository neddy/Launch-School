# ex_3.rb
# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.
#
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
#
# Example:

# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

# Understand the problem
# Rotate a number the maximum rotation
# to do this, rotate the first number to the back, then lock the first number in place and do the same for the second digit. Continue this until all numbers have been rotated.

# Data:
# I:integer
# O:integer
# A:
# store number as integer between rotations

# Algorithm
# Calculate integer length
# loop
#   pass integer to rotate_rightmost_digits, with length as second argument
#   save returned integer over original
#   subtract one from length
#   break loop when length == 0
# end loop
# return rotated integer

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(int1, int2)
  array1 = int1.to_s.chars
  array2 = array1.pop(int2)
  array2 = rotate_array(array2)
  array1 << array2
  array1.join.to_i
end

def max_rotation(int)
  int_length = int.to_s.size
  while int_length > 0 do
    int = rotate_rightmost_digits(int, int_length)
    int_length -= 1
  end
  int
end

# p max_rotation(735291)
# p max_rotation(8_703_529_146)

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
