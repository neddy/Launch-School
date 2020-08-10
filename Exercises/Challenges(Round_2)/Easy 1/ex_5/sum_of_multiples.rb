# require 'pry'

class SumOfMultiples
  DEFAULT_NUMBERS = [3, 5]

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(limit)
    (0...limit).select do |multiple|
      @numbers.any? { |n| multiple % n == 0 }
    end.reduce(:+)
  end

  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end
end

# p SumOfMultiples.new(3,5).to(20)

# puts SumOfMultiples.to(100)
