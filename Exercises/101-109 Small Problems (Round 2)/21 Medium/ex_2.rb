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
# take two arguments, an integer and another integer
# rotated the last n digits of the first number, n is the second supplied number


# Data
# I: 2 integers
# O: 1 integer
# A:
# split first integer into array of strings

# Algorithm
# split first number into array of strings
# split array into two arrays, with n elements in second array, where n is the second number passed to the method.
# pass the second array to the method 'rotate_array'
# save rotated array to second array
# join arrays back together
# join characters in array back together
# convert string to integer and return it


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

p rotate_rightmost_digits(735291, 2)
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
