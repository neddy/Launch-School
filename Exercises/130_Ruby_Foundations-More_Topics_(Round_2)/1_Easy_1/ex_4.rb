# ex_4.rb
# Divisors
# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.
#
# Examples


# class Prime
#   def self.array_up_to(limit)
#     raise ArgumentError if limit < 1
#     return 2 if limit == 1
#     @sieve_arr = []
#
#     (2..limit).each { |el| @sieve_arr[el] = el}
#
#     (2..limit).each do |n|
#       break if n.abs2 > limit
#       next unless @sieve_arr[n]
#       n.abs2.step(limit, n) { |m| @sieve_arr[m] = nil }
#     end
#
#     @sieve_arr.compact
#   end
#
#   def self.factors(n)
#     primes = array_up_to(n)
#     factors = primes.select { |prime| n % prime == 0 }
#   end
# end
#
#
# puts Prime.factors(99400891)
require 'benchmark'
def divisors(n)
  divisors_found = []
  (1..Integer.sqrt(n)).each do |i|
    divisors_found.concat([i, n/i]) if n % i == 0
  end
  divisors_found.uniq.sort
end

time1 = Benchmark.measure do
  p divisors(99400891)
end
puts "Faster Method: #{time1}"
# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

def divisors(n)
  divisors_found = []
  (1..n).each do |i|
    divisors_found << i if n % i == 0
  end
  divisors_found.uniq.sort
end
time2 = Benchmark.measure do
  p divisors(99400891)
end

# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


puts "Simple Method: #{time2}"
