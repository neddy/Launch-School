# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there articletwo same numbers
#   then that number can be used 2 times.

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

# Understand the problem
# take an array, find the maximum number in hte array
# check if any combination of 3 numbers in the array can be multiplied together to get the maximum number
#
# Data
# I: Array
# O: Boolean
# A: array
#
# Algorithm
# Assign maximum value in array to variable
# get all permutations of array with lenght 3, store as array of arrays
# iterate over array of 3 element permutations
#   count if the 3 elements multiplied together equal the maximum
# end
# if count > 0 return true, else false


# def mult_of_three_nums(array)
#   maximum = array.max
#   combinations = array.combination(3).to_a
#   combinations_count = combinations.count do |sub_array|
#     sub_array.reduce(:*) == maximum
#   end
#   combinations_count > 0 ? true : false
# end
#
# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false


def mult_of_three_nums(array)
  maximum = array.max
  combinations = []
  count = array.size
  count.times do |idx1|
    count.times do |idx2|
      count.times do |idx3|
        unless idx1 == idx2 || idx2 == idx3 || idx1 == idx3
          combinations << [array[idx1], array[idx2], array[idx3]]
        end
      end
    end
  end
  !!(combinations.detect{ |sub_array| sub_array.reduce(:*) == maximum})
end


p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false


# def combinations(list, count, prefix = [])
#   if count == 0
#     p prefix
#     return
#   end
#   list.size.times do |idx|
#     combinations(list[(idx + 1)..-1], count - 1, prefix + [list[idx]])
#   end
# end
#
# combinations([1,2,3,4,5,6], 3)
