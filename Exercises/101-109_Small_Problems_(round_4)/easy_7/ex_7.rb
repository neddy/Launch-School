# ex_7.rb

# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
#
# Examples:
#
# show_multiplicative_average([3, 5])
# The result is 7.500
#
# show_multiplicative_average([6])
# The result is 6.000
#
# show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

def show_multiplicative_average(arr)
  average = arr.reduce(:*) / arr.size.to_f
  puts "The result is " + format("%.3f", average)
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
