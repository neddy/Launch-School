# ex_8.rb
# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
#
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.
#


# Understand the problem
# Take an input of one integer, and return the next 'featured number' that is greater than the input
# A featured number is:
# * multiple of 7
# * odd
# * has no repeating numbers
# Note numbers above 9_999_999_999 cannot fufill the requirement
#
# Data:
# I: Integer
# O: integer, or print error to screen and return nil
#
# Algorithm
# next_number = input integer + 1
# featured_number = nil
# loop
#   if featured_number? is true
#     featured_number = next_number
#   end
#   break if featured_number not equal to nil || next_number > 9_999_999_999
#   next_number += 1
# end
# unless featured_number not equal to nil
#   puts "There is no possible number that fulfills those requirements"
# end
# return featured number

# Def featured_number?(integer)
#   if integer.odd?
#     if integer % 7 == 0
#       if characters of integer uniq
#         return true
#   else
#     return false

def featured_number?(num)
  numbers = num.to_s.chars
  num.odd? && num % 7 == 0 && numbers.size == numbers.uniq.size
end

# p featured_number?(21)

def featured(num)
  next_number = num + 1
  featured_number = nil
  loop do
    if featured_number?(next_number)
      featured_number = next_number
    end
    break if featured_number || next_number > 9_999_999_999
    next_number +=1
  end
  unless featured_number
    puts "There is no possible number that fulfills those requirements"
  end
  featured_number
end


p featured(12)
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
