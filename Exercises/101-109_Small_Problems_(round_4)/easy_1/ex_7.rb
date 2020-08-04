# ex_7.rb
#

# Stringy Strings
# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.
#
# Examples:
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# The tests above should print true.

# def stringy(num)
#   binary_string = "10" * (num/2)
#   (num % 2) == 0 ? binary_string : binary_string + "1"
# end
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'


def stringy(num)
  num.times.map { |n| n.even? ? 1 : 0 }.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
