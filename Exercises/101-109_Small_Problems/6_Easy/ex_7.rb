# ex_7.rb
# Halvsies

# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.
#
# Examples:

def halvsies(arr)
  size1 = (arr.size/2.0).round
  size2 = arr.size - size1
  [arr[0, size1], arr[-size2, size2]]
end

p halvsies([5])
p halvsies([1, 2, 3, 4])

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
