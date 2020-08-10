class PerfectNumber
  def initialize(number)
    raise StandardError if number < 1
    @number = number
  end

  def classify
    sum = sum_of_divisors
    case
      when sum < @number then 'deficient'
      when sum > @number then 'abundant'
      when sum == @number then 'perfect'
    end
  end

  def self.classify(number)
    PerfectNumber.new(number).classify
  end

  private

  def sum_of_divisors
    (1...@number).to_a.select { |n| @number % n == 0 }.sum
  end
end

# puts PerfectNumber.classify(28)
