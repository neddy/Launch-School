# ex_7.rb
# Merge Sorted Lists
# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.
#
# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.
#
# Your solution should not mutate the input arrays.
#
# Examples:

# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]


# Understand the problem
# Take two arrays that are sorted, then merge them into one array that is sorted. Don't sort the final array.
#
# Data
# I: 2 arrays
# O: array
#
# Solution
# Interate over both arrays, compare elements, and merge lesser element. Use the array indexes to keep track of where the program is, each time an element is merged, that index should be increased by 1.


def merge(arr1, arr2)
  if arr1.empty? || arr2.empty?
    return arr1 + arr2
  end
  idx1, idx2 = 0, 0
  merged_array = []
  loop do
    if !arr2[idx2]
      merged_array << arr1[idx1]
      idx1 += 1
    elsif !arr1[idx1]
      merged_array << arr2[idx2]
      idx2 += 1
    elsif arr1[idx1] < arr2[idx2]
      merged_array << arr1[idx1]
      idx1 += 1
    else
      merged_array << arr2[idx2]
      idx2 += 1
    end
    break if merged_array.size == (arr1.size + arr2.size)
  end
  merged_array
end

p merge([1, 5, 9], [2, 6, 8])
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
