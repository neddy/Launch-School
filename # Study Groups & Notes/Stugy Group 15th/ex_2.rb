# Given an array of integers, find the maximum difference between the successive elements in its sorted form.

# Notes
# - Array size is at least 3 .
# - Array's numbers Will be mixture of positives, negatives, and zero.
# - Repetition of numbers in the array could occur.
# - The Maximum Gap is computed Regardless the sign.

# p max_gap([13,10,2,9,5]) == 4
# p max_gap([13,3,5]) == 8
# p max_gap([24,299,131,14,26,25]) == 168
# p max_gap([-3,-27,-4,-2]) == 23
# p max_gap([-7,-42,-809,-14,-12]) == 767
# p max_gap([12,-5,-7,0,290]) == 278
# p max_gap([-54,37,0,64,-15,640,0]) == 576
# p max_gap([130,30,50]) == 80
# p max_gap([1,1,1]) == 0
# p max_gap([-1,-1,-1]) == 0
#
# Understand the problem
# take array
# sort the array
# find the maximum difference between elements
#
# Data
# I:array
# O:integer
#
# Algorithm
# Sort array
# iterate over numbers, storing maximun difference

def max_gap(array)
  array.sort!
  maximum = 0
  (0..array.size - 2).each do |idx|
    current_difference = array[idx] - array[idx + 1]
    maximum = current_difference.abs if maximum < current_difference.abs
  end
  maximum
end

max_gap([13,10,2,9,5])
p max_gap([13,10,2,9,5]) == 4
p max_gap([13,3,5]) == 8
p max_gap([24,299,131,14,26,25]) == 168
p max_gap([-3,-27,-4,-2]) == 23
p max_gap([-7,-42,-809,-14,-12]) == 767
p max_gap([12,-5,-7,0,290]) == 278
p max_gap([-54,37,0,64,-15,640,0]) == 576
p max_gap([130,30,50]) == 80
p max_gap([1,1,1]) == 0
p max_gap([-1,-1,-1]) == 0
