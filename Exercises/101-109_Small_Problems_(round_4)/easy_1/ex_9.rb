# ex_9.rb
# Sum of Digits

# Write a method that takes one argument, a positive integer, and returns the sum of its digits.
#
# Examples:
#
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
# The tests above should print true.
#
# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

def sum(num)
  num_arr = num.to_s.chars.map(&:to_i)
  num_arr.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
