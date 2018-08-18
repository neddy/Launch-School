# ex_2.rb
# The number 12 is the first number in having six divisors, they are: 1, 2, 3, 4, 6 and 12. Your challenge for this kata is to find the minimum number that has a certain number of divisors. For this purpose we have to create the function

# find_min_num() or findMinNum() or similar in the other languages
#
# that receives the wanted number of divisors num_div, and outputs the smallest number having an amount of divisors equals to num_div.
#
# Let's see some cases:
#
# find_min_num(10) = 48 # divisors are: 1, 2, 3, 4, 6, 8, 12, 16, 24 and  48
# find_min_num(12) = 60
# In this kata all the tests will be with numDiv < 80
#
# (There will be a next kata with numDiv < 10000, Find the First Number Having a Certain Number of Divisors II, should have the help of number theory)
#
# Enjoy it and happy coding! (Memoization is advisable)

# Understand the problem
# take an integer as input, n
# find the minimum number with n divisors
#
# Data
# I: integer (divisors)
# O: integer (minimum number)
#
# Algorithm
#
# divisors(n)
#   iterate over range of numbers from 1 to n
#   count those where n % i == 0
#   return count

# set desired_divisors = input
# set n = 1
# set minimum_num = nil
# loop until minimum number found
#   minimum_num = n if divisors(n) >= desired_divisors
#   n += 1
# end loo
# return minimum_num
#

# My first solution, too slow for large numbers
# def find_min_num(num)
#   n = 1
#   minimum_num = nil
#   loop do
#     minimum_num = n if (1..n).count { |i| n % i == 0 } == num
#     n += 1
#     break if minimum_num
#   end
#   minimum_num
# end

require 'prime'

# I stole this part from somewhere on the web...
def divisors(n)
  arr = Prime.prime_division(n).map { |v,exp| (0..exp).map { |i| v**i } }
  arr.first.product(*arr[1..-1]).map { |a| a.reduce(:*) }.map { |m| [m,n/m] }
end

# This was my part
def find_min_num(num)
  return 1 if num == 1
  n = 2
  minimum_num = nil
  loop do
    minimum_num = n if divisors(n).flatten.uniq.size == num
    n += 1
    break if minimum_num
  end
  minimum_num
end


p find_min_num(1)
p find_min_num(2)
p find_min_num(3)
p find_min_num(4)
p find_min_num(10)
p find_min_num(12)
p find_min_num(80)

# def find_all_up_to(n)
#   pairs = {}
#   (1..n).each do |i|
#     pairs[i] = find_min_num(i)
#   end
#   pairs
# end
#
#
# # p find_all_up_to(17)
#
# def divisors(n)
#   arr = Prime.prime_division(n).map { |v,exp| (0..exp).map { |i| v**i } }
#   arr.first.product(*arr[1..-1]).map { |a| a.reduce(:*) }.map { |m| [m,n/m] }
# end
#
# def factors_of(number)
#   primes, powers = number.prime_division.transpose
#   exponents = powers.map{|i| (0..i).to_a}
#   divisors = exponents.shift.product(*exponents).map do |powers|
#     primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
#   end
#   divisors.sort.map{|div| [div, number / div]}
# end
#
# def find_all_up_to(n)
#   pairs = { 1 => 1 }
#   current_no = 2
#   i = 2
#   loop do
#     current_count = divisors(i).flatten.uniq.size
#     if current_count == current_no
#       pairs[current_no] = i unless pairs[current_no]
#       current_no += 1
#       i = 2
#     end
#     i += 1
#     break if n < current_no
#   end
#   pairs
# end
#
# # p factors_of(48).flatten.uniq.size
# p find_all_up_to(10)
#
# ref = {1=>1, 2=>2, 3=>4, 4=>6, 5=>16, 6=>12, 7=>64, 8=>24, 9=>36, 10=>48, 11=>1024, 12=>60, 13=>4096, 14=>192, 15=>144, 16=>120, 17=>65536}
