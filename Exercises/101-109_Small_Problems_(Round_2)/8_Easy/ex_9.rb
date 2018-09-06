# ex_9.rb
# Convert number to reversed array of digits
# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # Note that zeros get dropped!
# reversed_number(1) == 1

# Understand the problem
# take an integer
# return it's reversed integer
# leading zeros get dropped


# Data
# I: integer
# O: integer
# A: convert integer to string and manipulate, then convert back

# Algorithm
# convert integer to string
# reverse string
# convert to integer
# return integer

def reversed_number(n)
  n.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
