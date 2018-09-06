# ex_9.rb
# Bubble Sort
# Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.
#
# A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.
#
# We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.
#
# For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.
#
# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.
#
# Examples
#
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]
#
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Understand the problem
# Take a list of items and sort them using the bubble sort method
# The bubble sort method dictates that you iterate over all the items in the collection
# swaping each pair in which the first value is great than the second value
# the list is sorted when a pass can be made without swapping anything
#
# Data
# I: array
# O: array
#
# Solution
# SET iteration_counter to array length - 1
# loop do
#   iterate over the items (iteration_counter) times
#     compare the element at counter position 0 with that one ahead of it
#     swap them if the first element is greater than the second
#     set the swap toggle to true if a swap as made
#   loop
#   break if swap toggle if false
#   set swap toggle to false
#   set iteration_counter -= 1
# end loop

def bubble_sort!(array)
  iterations = array.size - 1
  loop do
    swapped = false
    iterations.times do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        swapped = true
      end
    end
    break unless swapped
    iterations -= 1
  end
  array
end


array = [5, 3]
p bubble_sort!(array)
array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
