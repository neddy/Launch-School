# ex_2.rb
# Double Doubles
# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
#
# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# Understand the problem
# take a number
# if the number has an even number of digits, and the left side is the same as the right side, return it.
# otherwise double the number and return it.
#
# Data
# I: integer
# O: integer
#
#
# Algorithm
# convert number to string
# if number has even number of digits
#   if sides are the same
#     return number
#   end
# end
# otherwise return number doubled.

def twice(number)
  numbers_string = number.to_s
  double_number = false
  if numbers_string.size.even?
    center = numbers_string.size / 2
    left_side = numbers_string.slice(0, center)
    right_side = numbers_string.slice(center, center)
    if left_side == right_side
      double_number = true
    end
  end
  double_number ? number : number * 2
end

p twice(37)
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
