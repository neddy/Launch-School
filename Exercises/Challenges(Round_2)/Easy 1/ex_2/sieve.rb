# require 'pry'

class Sieve
  def initialize(boundary)
    raise ArgumentError, "Number must be greater than 1" if boundary < 2
    @primes = (2..boundary).to_a
  end

  def primes
    index = 0
    loop do
      @primes.reject! do |n|
        n != @primes[index] && n % @primes[index] == 0
      end
      index += 1
      break if @primes.length <= index
    end
    @primes
  end
end



# p Sieve.new(1000).primes
