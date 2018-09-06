# I:integer
# O:integer
# F:
# Interate over integers 1 to n
# Test if number is odd and not prime
# sum count

def prime?(n)
  return false if n == 1
  (2...n).each do |i|
    return false if n % i == 0
  end
  true
end

def odd_not_prime(n)
  count = 0
  (1..n).each do |i|
    if i.odd?
      count += 1 unless prime?(i)
    end
  end
  count
end

p odd_not_prime(15)
p odd_not_prime(48)
p odd_not_prime(82)
