# This one is pretty fast when looking for smaller primes

class Prime
  STARTING_PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31].freeze

  def self.nth(n)
    raise ArgumentError if n < 1

    primes = STARTING_PRIMES.dup
    return primes[n - 1] if n <= STARTING_PRIMES.size

    current_number = primes.last + 2

    while primes.size < n do
      primes << current_number if prime?(current_number, primes)
      current_number += 2
    end
    primes.last
  end

  def self.prime?(n, previous_primes)
    sqrt_n = Integer.sqrt(n)
    divisor = previous_primes.detect do |prime|
                break if prime > sqrt_n
                n % prime == 0
              end
    !divisor
  end
end

# puts Prime.nth(20)
