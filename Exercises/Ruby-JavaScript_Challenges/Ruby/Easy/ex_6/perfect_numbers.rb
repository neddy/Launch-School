# class PerfectNumber
#   def self.classify(n)
#     raise StandardError unless n > 1
#     new(n).classification
#   end
#
#   def initialize(n)
#     @number = n
#   end
#
#   def sum_of_factors
#     (1...@number).select { |n| @number % n == 0 }.sum
#   end
#
#   def classification
#     case sum_of_factors
#     when (1...@number) then "deficient"
#     when @number then "perfect"
#     else "abundant"
#     end
#   end
# end

class PerfectNumber
  def self.classify(number)
    raise StandardError unless number > 1

    case sum_of_factors(number)
    when (1...number) then "deficient"
    when number then "perfect"
    else "abundant"
    end
  end

  class << self
    private
    def sum_of_factors(number)
      (1...number).select { |n| number % n == 0 }.sum
    end
  end
end

# puts PerfectNumber.classify(2)
