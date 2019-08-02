require 'pry'

class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(max_factor: nil, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    factors = (min_factor..max_factor).to_a
    combinations = factors.combination(2).to_a + factors.zip(factors)

    combinations.each do |a, b|
      product = a * b
      @palindromes[product] << [a,b] if palindrome?(product)
    end
    nil
  end

  def largest
    Palindrome.new(*palindromes.sort.last)
  end

  def smallest
    Palindrome.new(*palindromes.sort.first)
  end

  private
  attr_reader :max_factor, :min_factor, :palindromes

  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end
end

# test = Palindromes.new(max_factor: 9)
# # puts test.palindrome?(10)
# test.generate
# largest = test.largest
# p largest.value
# p largest.factors
