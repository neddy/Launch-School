# ex_4.rb

def divisors(n)
  all_divisors = []

  (1..n).each do |i|
    all_divisors << i if n % i == 0
  end
  all_divisors
end


puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
