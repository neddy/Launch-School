# ex_4.rb
# Counting Up
# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
#
# You may assume that the argument will always be a valid integer that is greater than 0.
#
# Examples:

def sequence(num)
  num > 0 ? (1..num).to_a : (num..-1).to_a.reverse
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(5)
puts sequence(-5)
