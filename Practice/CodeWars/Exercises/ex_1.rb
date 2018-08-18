# ex_1.rb
# Bob is preparing to pass IQ test. The most frequent task in this test is to find out which one of the given numbers differs from the others. Bob observed that one number usually differs from the others in evenness. Help Bob — to check his answers, he needs a program that among the given numbers finds one that is different in evenness, and return a position of this number.

# ! Keep in mind that your task is to help Bob solve a real IQ test, which means indexes of the elements start from 1 (not 0)

##Examples :

# iq_test("2 4 7 8 10") # => 3 // Third number is odd, while the rest of the numbers are even
#
# iq_test("1 2 1 1") # => 2 // Second number is even, while the rest of the numbers are odd
#
#
# Understand the problem
# Write a program that finds the odd number out. There will be a series of numbers, all but one of the numebers will be odd, or vice versa
# Return the index of the odd one out (index starts at 1)
#
# Data:
# I: string
# O: index of odd number
#
# Algorithm
# split the string into numbers, and convert numbers to integers
# find the number that is the only odd or even number in the array
# return the index of the number which was found


def iq_test(numbers)
  array_of_numbers = numbers.split.map { |n| n.to_i }
  index = array_of_numbers.find_index do |n|
            if array_of_numbers.one?{ |n| n.odd? }
              n.odd?
            else
              n.even?
            end
          end
  index + 1
end


p iq_test("2 4 7 8 10") # => 3 // Third number is odd, while the rest of the numbers are even

p iq_test("1 2 1 1") # => 2 // Second number is even, while the rest of the numbers are odd
