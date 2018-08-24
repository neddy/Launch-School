# ex_3.rb
# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.
#
# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
#
# Example:

# Understand the problem
# Rotate all digits in a number by starting on the left,
# rotating the number, then leaving the left most digit in place and rotating the digits to the right
# Then repeat, leaving one more digit in place, until all digits have been rotated
#
# Data
# I: integer
# O: rotated integer
#
# Solition
# take the lenght of the integer passed in
# then iterate from the integer length, down to 1
#   pass the number to rotate_rightmost_digits with the current number from the iteration
#   assign the return value as the number
# end iteration
# return number


def rotate_array(array)
  array[1..-1] + [array[0]]
end

# My solution
def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  digits += rotate_array(digits.pop(n))
  digits.join.to_i
end

def max_rotation(number)
  (number.to_s.size).downto(1) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end


p max_rotation(735291)
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


# Further exploration

# Understand the problem
# Understand the problem
# Rotate all digits in a number by starting on the left,
# rotating the number, then leaving the left most digit in place and rotating the digits to the right
# Then repeat, leaving one more digit in place, until all digits have been rotated
#
# Data
# I: integer
# O: rotated integer
#
# Solition
# take the lenght of the integer passed in
# split the number into characters
# then iterate from up to length - 1
#   take the character at index i and move it to the end of the array
# end iteration
# join the array back together and return as number

def max_rotation(number)
  digits = number.to_s.chars
  digits.size.times do |idx|
    digits += [digits.slice!(idx)]
  end
  digits.join.to_i
end


p max_rotation(735291)
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
