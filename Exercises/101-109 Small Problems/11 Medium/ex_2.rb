# ex_2.rb
# Rotation (Part 2)
# Write a method that can rotate the last n digits of a number. For example:

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(number, n)
  digits_arr = number.to_s.chars
  digits_arr << rotate_array(digits_arr.slice!(-n, n))
  digits_arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Note that rotating just 1 digit results in the original number being returned.
#
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
#
# You may assume that n is always a positive integer.

# Recommended Solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# Student Solution
def rotate_rightmost_digits(number, places)
  digits = number.to_s.chars
  digits << digits.slice!(-places)
  digits.join.to_i
end
