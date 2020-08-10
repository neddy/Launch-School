# require 'pry'

class SumOfMultiples
  DEFAULT_NUMBERS = [3, 5]

  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end

  def to(limit)
    multiples = [0]

    @numbers.each do |number|
      multiples += find_multiples(limit, number)
    end

    multiples.uniq.reduce(&:+)
  end

  private

  def find_multiples(limit, number)
    multiples = []

    multiplier = 1
    loop do
      product = multiplier * number
      break if product >= limit
      multiples << product
      multiplier += 1
    end
    multiples
  end
end

# puts SumOfMultiples.to(100)
