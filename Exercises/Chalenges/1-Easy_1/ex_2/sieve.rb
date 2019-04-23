class NumberTooLow < StandardError; end

class Sieve
  attr_reader :n, :initial_array, :primes_array
  def initialize(n)
    raise NumberTooLow, "Number must be greater than 2" if n < 2
    @n = n
    @range = 2.upto(@n).to_a
    @primes_array = []
  end

  def primes
    @primes_array = @range.dup
    current_index = 0
    while current_index < @primes_array.size - 1 do
      current_prime = @primes_array[current_index]
      @primes_array.delete_if do |n|
        n != current_prime && n % current_prime == 0
      end
      current_index += 1
    end
    @primes_array
  end

end

# p Sieve.new(1000).primes
