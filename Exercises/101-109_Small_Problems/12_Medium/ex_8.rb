# ex_8.rb
# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
#
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.
#
# Examples:

def featured(number)
  max = 9_876_543_210
  number += 1
  number += 1 until number.odd? && number % 7 == 0
  loop do
    number_chars = number.to_s.chars
    if number_chars.size == number_chars.uniq.size
      return number
    end
    if number > max
      break
    end
    number += 14
  end
  "ERROR! No next featured number!"
end


p featured(12)
p featured(20)
p featured(21)
p featured(997)
p featured(1029)

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# PSEUDO CODE

# DEFINE Method
#   GET NUMBER
#   NUMBER = ((NUMBER / 7) + 1) * 7
#   LOOP DO
#     ADD 7 to n
#     IF n is odd AND n charaters uniq
#       RETURN NUMBER
#     END IF
#     IF NUMBER > 9_999_999_999
#       RETURN "ERROR! No next featured number!"
#     END IF
#   END LOOP
# END Method
