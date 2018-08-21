# ex_5.rb
# You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

# # Examples
# [2, 4, 0, 100, 4, 11, 2602, 36]
# # Should return: 11 (the only odd number)
#
# [160, 3, 1719, 19, 11, 13, -21]
# # Should return: 160 (the only even number)
#
# understand the problem
# Take an array of integers, find the odd one out.
#
# Data
# I: array
# O: integer
#
# Solution
# Take the first 3 elements of the array, determine if more are odd or even.
# Detect the element in the array for which the count was lower on the above

def find_outlier(integers)
  find_odd = integers[0..2].count{ |e| e.even? } > 1
  find_odd ? integers.detect{ |e| e.odd? } : integers.detect{ |e| e.even? }
end

p find_outlier([0, 1, 2])
p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([2,6,8,10,3]) == 3
