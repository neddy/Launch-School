# ex_8.rb
# Multiply Lists
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.
#
# Examples:

# I: 2 arrays
# O: array
# F:
# iterate through first array and multply each value by it's matching value in secind array

def multiply_list(array1, array2)
  array1.map.with_index do |element, idx|
    element * array2[idx]
  end
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


def multiply_list(array1, array2)
  array1.zip(array2).map { |a, b| a * b }
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
