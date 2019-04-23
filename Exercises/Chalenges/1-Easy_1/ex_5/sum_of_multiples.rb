# class SumOfMultiples
#   DEFAULT_MULTIPLIERS = [3, 5]
#
#   def initialize(*nums)
#     @multipliers = nums
#   end
#
#   def self.to(n)
#     self.new(*DEFAULT_MULTIPLIERS).to(n)
#   end
#
#   def to(n)
#     find_multiples(n).reduce(&:+)
#   end
#
#   def find_multiples(n)
#     @multipliers.map do |m|
#       multiples = (m...n).step(m).to_a
#       multiples.empty? ? 0 : multiples
#     end.flatten.uniq
#   end
# end

# p SumOfMultiples.new(3, 5, 7).to(20)
# p SumOfMultiples.to(10)

# p SumOfMultiples.new(3, 5, 7).to(20)
# p SumOfMultiples.to(1000)

class SumOfMultiples
  DEFAULT_MULTIPLIERS = [3, 5]

  def initialize(*nums)
    @multipliers = nums
  end

  def self.to(n)
    self.new(*DEFAULT_MULTIPLIERS).to(n)
  end

  def to(n)
    find_multiples_upto(n).reduce(&:+)
  end

  def find_multiples_upto(n)
    @multipliers.map do |m|
      multiples = (m...n).step(m).to_a
      multiples.empty? ? 0 : multiples
    end.flatten.uniq
  end
end

# p SumOfMultiples.new(3, 5, 7).to(20)
# p SumOfMultiples.to(10)
#
# p SumOfMultiples.new(3, 5, 7).to(20)
# p SumOfMultiples.to(1000)
