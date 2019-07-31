# This one is fast when looking for larger primes

class Prime
  CHUNK_SIZE = 1_000_000

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
