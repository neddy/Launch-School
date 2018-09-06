# ex_9.rb
# Bubble Sort
# Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.
#
# A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

# We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.
#
# For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.
#
# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.


# Understand the problem
# create a method to sort an array
# the method shoud sort the array by looping through the elements, comparing the first element to the
# second and so on. The array is sorted when a full pass of the array can be made without making any swaps
#
# Data
# I: array
# O: sorted array
#
# Algorithm
# loop
#   swapped = no
#   loop (array size - 1) times
#     compare element at count index to element at count index + 1
#     if element1 > element2
#       swap elements
#       swapped = yes
#     end
#   end
#   break if swapped == no
# end


def bubble_sort!(array)
  count = array.size - 1
  loop do
    swapped = false
    (count).times do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        swapped = true
      end
    end
    break unless swapped
    count -= 1
  end
  nil
end


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
