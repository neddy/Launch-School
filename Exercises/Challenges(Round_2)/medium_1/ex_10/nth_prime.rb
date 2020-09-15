class Prime
  def self.nth(n)
    raise ArgumentError unless n > 0
    primes = [2]
    number = 3
    while primes.size < n do
      is_prime = true
      primes.each do |prime|
        break if prime > Math.sqrt(number)
        is_prime = false if number % prime == 0
      end
      primes << number if is_prime
      number += 2
    end
    primes.last
  end
end
# p Prime.nth(6)
