# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1

# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# i integer
# o: integer
# f:
# Create array of number from 1 to 'x'
# interate over each number
#  unless even or prime(Method) add 1 to count
# return count

# prime?
  # create range from 1 to x
  # iterate over numbers
  #   return false if x is divisible by any number
  # return true

# require 'prime'

def prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
    # binding.pry
  end
  num == 1 ? false : true
end

# p prime?(6)


def odd_not_prime(num)
  count = 0
  (1..num).each do |i|
    count += 1 unless i.even? || prime?(i)
  end
  count
end

p odd_not_prime(15)
p odd_not_prime(48)
p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
