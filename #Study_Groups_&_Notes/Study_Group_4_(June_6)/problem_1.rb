# Positive integers that are divisible exactly by the sum of their digits are called Harshad numbers. The first few Harshad numbers are: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 18, ...

# We are interested in Harshad numbers where the product of its digit sum s and s with the digits reversed, gives the original number n. For example consider number 1729:

# its digit sum, s = 1 + 7 + 2 + 9 = 19
# reversing s = 91
# and 19 * 91 = 1729 --> the number that we started with.
# Complete the function which tests if a positive integer n is Harshad number, and returns True if the product of its digit sum and its digit sum reversed equals n; otherwise return False.

# I:number
# O: Boolean
# F:
# Calcualte the sum of digits
# Test if number is divisible by sum of digits
# Test if sum * sum reversed is equal to number

def number_joy(number)
  numbers = number.to_s.split('')
  numbers.map! do |n|
    n.to_i
  end
  sum = numbers.sum

  if number % sum != 0
    return false
  end
  sum_reversed = sum.to_s.reverse.to_i

  if (sum * sum_reversed) == number
    true
  else
    false
  end
end
# p number_joy(1998)
# p number_joy(1997)
# p number_joy(1729)
p number_joy(1997) == false
p number_joy(1998) == false
p number_joy(1729) == true
p number_joy(18)   == false
p number_joy(81)   ==  true
p number_joy(1458) ==  true
