require 'benchmark'
require 'pry'

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

class PrimeDana

  LIMIT = 3_000_000

  def self.nth(n)
    raise ArgumentError if n < 1
    return 2 if n == 1
    @sieve_arr = []

    [*2..LIMIT].each { |el| @sieve_arr[el] = el}

    [*2 .. LIMIT].each do |n|
      break if n.abs2 > LIMIT
      next unless @sieve_arr[n]
      n.abs2.step(LIMIT, n) { |m| @sieve_arr[m] = nil }
    end

    @sieve_arr.compact[0...n].last
  end
end

class PrimeChunkOne
  CHUNK_SIZE = 3_000_00

  def self.nth(n)
    primes = [2, 3]

    while primes.size < n do
      start_range = primes.last + 1
      finish_range = primes.last + CHUNK_SIZE
      current_chunk = (start_range..finish_range).to_a

      # Should be able to refactor both methods below into one method that takes the collection as an argument, along with a block that defines how to find the start index.
      time1 = Benchmark.measure do
        primes.each do |prime|
          break if prime.abs2 > finish_range
          start_index = current_chunk.index { |x| x && x.abs2 % prime == 0 }
          if start_index
            start_index.step(current_chunk.size - 1, prime) { |j| current_chunk[j] = nil }
          end
        end
      end

      time2 = Benchmark.measure do
        current_chunk.dup.each do |i|
          next unless i
          break if i.abs2 > finish_range
          start_index = current_chunk.index(i.abs2)
          if start_index
            start_index.step(current_chunk.size - 1, i) { |j| current_chunk[j] = nil }
          end
        end
      end

      # puts "Time 1: " + time1.to_s
      # puts "Time 2: " + time2.to_s

      primes = primes + current_chunk.compact
    end
    primes[n - 1]
    # primes
  end
end

class PrimeChunkTwo
  # I wanted to try to create a second method that yielded to a block in this one.
  CHUNK_SIZE = 3_000_000

  def self.nth(n)
    primes = [2, 3]

    while primes.size < n do
      start_range = primes.last + 1
      finish_range = primes.last + CHUNK_SIZE
      current_chunk = (start_range..finish_range).to_a

      time1 = Benchmark.measure do
        seive_chunk(current_chunk, finish_range, primes) do |chunk, n|
          chunk.index { |x| x && x % n.abs2 == 0 }
        end
      end

      time2 = Benchmark.measure do
        seive_chunk(current_chunk, finish_range) do |chunk, n|
          chunk.index(n.abs2)
        end
      end

      puts "Time 1: " + time1.to_s
      puts "Time 2: " + time2.to_s

      primes = primes + current_chunk.compact
    end
    primes[n - 1]
  end

  def self.seive_chunk(chunk, finish_range, primes = nil)
    chunk_divisors = if primes
                       primes
                     else
                       chunk.dup
                     end

    chunk_divisors.each do |n|
      next unless n
      break if n.abs2 > finish_range
      start_index = yield(chunk, n)
      if start_index
        start_index.step(chunk.size - 1, n) { |j| chunk[j] = nil }
      end
    end
  end
end

class PrimeChunkThree
  # In this one, add the new chunk to the existing primes and then run sieve on whole collection, therefor not needing to test for divisibiliy with previous primes. i.e. `start_index = current_chunk.index { |x| x && x.abs2 % prime == 0 }`
  CHUNK_SIZE = 2_000_000

  def self.nth(n)
    raise ArgumentError if n < 1

    primes = [2]
    collection_to_seive = []

    while primes.size < n do
      start_chunk = primes.last
      limit = start_chunk + CHUNK_SIZE
      (start_chunk..limit).each { |i| collection_to_seive[i] = i }

      sieve(collection_to_seive, limit)

      primes = collection_to_seive.compact
    end
    primes[n - 1]
  end

  def self.sieve(collection, limit)
    collection.dup.each do |n|
      next unless n
      break if n.abs2 > limit
      n.abs2.step(collection.size - 1, n) { |j| collection[j] = nil }
    end
  end
end

class PrimeChunkFour
  CHUNK_SIZE = 1_000_000

  def self.nth(n)
    raise ArgumentError if n < 1

    primes = [2]
    collection_to_seive = []

    while primes.size < n do
      start_chunk = primes.last
      limit = start_chunk + CHUNK_SIZE
      (start_chunk..limit).each { |i| collection_to_seive[i] = i }

      sieve(collection_to_seive, start_chunk, limit)

      primes = collection_to_seive.compact
    end
    primes[n - 1]
  end

  def self.sieve(collection, start_chunk, limit)
    collection.dup.each do |n|
      next unless n
      break if n.abs2 > limit
      start_index = collection[start_chunk..-1].detect { |x| x && x % n.abs2 == 0 }
      next unless start_index
      start_index.step(collection.size - 1, n) { |j| collection[j] = nil }
    end
  end
end


prime_to_find = 10_001

# puts "Original: " + Prime.nth(prime_to_find).to_s
# puts "ChunkThree: " + PrimeChunkThree.nth(prime_to_find).to_s

# Benchmarks

# puts "Original"
# 1.times do
#   time = Benchmark.measure do
#     puts "Answer: #{Prime.nth(prime_to_find)}"
#   end
#   puts time
# end
#
# puts "Prime Chunk One"
# 1.times do
#   time = Benchmark.measure do
#     puts "Answer: #{PrimeChunkOne.nth(prime_to_find)}"
#   end
#   puts time
# end

# This one is slow...
# puts "Prime Chunk Two"
# 1.times do
#   time = Benchmark.measure do
#     puts "Answer: #{PrimeChunkTwo.nth(prime_to_find)}"
#   end
#   puts time
# end

# This one is fastest for larger primes and has no upper limit.
puts "Prime Chunk Three"
1.times do
  time = Benchmark.measure do
    puts "Answer: #{PrimeChunkThree.nth(prime_to_find)}"
  end
  puts time
end

# This one is slowest...
# puts "Prime Chunk Four"
# 1.times do
#   time = Benchmark.measure do
#     puts "Answer: #{PrimeChunkFour.nth(prime_to_find)}"
#   end
#   puts time
# end

# This has an arbitray upper limit
# puts "Dana solution"
# 1.times do
#   time = Benchmark.measure do
#     puts "Answer: #{PrimeDana.nth(prime_to_find)}"
#   end
#   puts time
# end
