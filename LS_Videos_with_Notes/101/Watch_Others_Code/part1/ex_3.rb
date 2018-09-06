# write a method that combines two arrays passed in as arguments, and returns a new array that contains all the elements from both arrays as arguments, with the elements taken in alternation.
#
# You may assume that both arrays will not be empty and that they will have the same number of elements
#
# Understand the problem
# take two arrays as input and interleave them
# start with first element of the first array
#
# Data
# I: 2 x arrays
# O: 1 x array
#
# Solution
# count the number of elements in the array, then loop that many times, appending one element from each array to a new empty array each iteration.

def interleave(arr1, arr2)
  count = arr1.size
  interleaved = []
  count.times do
    interleaved << arr1.shift
    interleaved << arr2.shift
  end
  interleaved
end

p interleave([1, 2, 3],%w(a b c))
