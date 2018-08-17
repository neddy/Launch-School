# ex_1.rb
# Sum of Sums
# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.
#
# Examples:


# Take the sum of the sums, moving from left to right, adding one number to the sequence each iteration.

# Tests:

# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data structure:
# input will be an array
# output will be an integer
# internally we will store the sum as an integer, and the sum of the last set of digits as an integer



# Algorithm

# declare to variables, one for the total sum, and one for the sum of digits in the sequence until that point
#
# Loop iterate over the array of numbers
#   add current number to the sequene total
#   add sequence total to running total
# end
#
# return running total

def sum_of_sums(array)
  sequence_total = 0
  sum = 0
  array.each do |n|
    sequence_total += n
    sum += sequence_total
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
