# ex_3.rb
# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.
#
# Examples:

# def missing(arr)
#   (arr.first..arr.last).reject { |el| arr.include?(el) }
# end
#
# # puts missing([-3, -2, 1, 5])
#
# puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# puts missing([1, 2, 3, 4]) == []
# puts missing([1, 5]) == [2, 3, 4]
# puts missing([6]) == []


def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    # result.concat(((first + 1)..(second - 1)).to_a)
    puts first
    puts second
    # puts ((first + 1)..(second - 1)).to_a
  end
  result
end

puts missing([-3, -2, 1, 5])
