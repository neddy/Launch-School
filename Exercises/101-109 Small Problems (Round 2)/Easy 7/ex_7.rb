# ex_7.rb
# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
#

# I: Array
# O: print to screen, nil returned
# F:
# multiply all elements tegether
# divide result by length of input array
# print result
# return nil


# Examples:

def show_multiplicative_average(array)
  sum = array.reduce(:*)
  result = sum / array.size.to_f
  puts format('%.3f', result)
end


show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
