# ex_8.rb
# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
#
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.
#
# Examples:
#
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
#
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Understand the problem
# take an integer as input, then return the next featured number
#
# A featured number is:
# a multiple of 7
# is odd
# does not have any repeating digits
#
# Data
# I: integer
# O: integer
#
# Solution
# take a number, find the next odd multiple of 7 after that number
# loop
#   then test if digits are all unique
#   iterate to next odd multiple of 7
#   return 'no next num' if current number greater than 9876543210
# end
# return last number

def featured(n)
  n += 1
  n += 1 until n % 7 == 0 && n.odd?
  loop do
    break if n.to_s.chars.uniq.join == n.to_s
    n += 14
    if n > 9876543210
      puts "There is no possible number that fulfills those requirements"
      return nil
    end
  end
  n
end


p featured(12)
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
