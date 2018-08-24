# ex_1.rb
# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
#
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.
#
# Example:
#
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# I: 2 x arrays
# O: array
# F:
# Get size of array
# loop array.size times
#   append element from each list to new array
# end
# return new array

def interleave(arr1, arr2)
  size = arr1.size
  count = 0
  new_arr = []
  while count < size do
    new_arr << arr1[count]
    new_arr << arr2[count]
    count += 1
  end
  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
