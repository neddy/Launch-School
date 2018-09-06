# ex_7.rb
# Merge Sorted Lists
# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.
#
# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.
#
# Your solution should not mutate the input arrays.
#
# Examples:

def merge(arr1, arr2)
  index1 = 0
  index2 = 0
  new_arr = []
  loop do
    case
    when arr1[index1] == nil
      new_arr << arr2[index2]
      index2 += 1
    when arr2[index2] == nil
      new_arr << arr1[index1]
      index1 += 1
    when arr1[index1] < arr2[index2]
      new_arr << arr1[index1]
      index1 += 1
    else
      new_arr << arr2[index2]
      index2 += 1
    end
    break if index1 >= (arr1.size) && index2 >= (arr2.size)
  end
  new_arr
end

p merge([1, 5, 9], [2, 6, 8])

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
