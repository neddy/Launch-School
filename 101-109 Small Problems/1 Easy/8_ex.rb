# 8_ex.rb
=begin
__Problem to solve:__
  Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.


__ Understand the Problem __
(Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

  Return the average of an array


__ Examples / Test Cases __
(Input / Output, Edge Cases? Bad input?)

  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40



__ Data Structures __
(What data structure fits the problem and the input data?)
(Rules / requirements for input data?)

  Input taken as Array
  Output as integer


__ Algorithm __
(Create algorithm using language of chosen data structure)
  Sum all elements of array
  then divide by number of elements in array



__ Abstraction __
(Solve in 1-2 sentences, solve small problems)



__ Code Below __
=end


def average(arr)
  arr.sum / arr.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25     # => True
puts average([9, 47, 23, 95, 16, 52]) == 40  # => True


# Further Exploration
def average(arr)
  (arr.sum / arr.length.to_f).round(2)
end

puts average([1, 5, 87, 45, 8, 8])      # => 25.67
puts average([9, 47, 23, 95, 16, 52])   # => 40.33
