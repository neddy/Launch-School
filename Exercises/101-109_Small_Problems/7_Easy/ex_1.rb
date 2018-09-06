# ex_1.rb
# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
#
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.
#
# Example:

def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |_, index|
    new_arr << arr1[index]
    new_arr << arr2[index]
  end
  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
