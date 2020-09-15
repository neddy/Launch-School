class Palindromes

  def initialize(max_factor:, min_factor: 1)
    @range = (min_factor..max_factor)
  end

  def generate
    find_factors
    @palindromes = []
    @all_values_w_factors.each do |value, factors|
      @palindromes << Palindrome.new(value, factors) if palindrome?(value)
    end
    @palindromes.sort!
    self
  end

  def largest
    @palindromes.last
  end

  def smallest
    @palindromes.first
  end

  private
  # def find_factors
  #   @all_values_w_factors = Hash.new { |h,k| h[k] = [] }
  #   (@min_factor..@max_factor).each do |factor_1|
  #     (@min_factor..@max_factor).each do |factor_2|
  #       @all_values_w_factors[factor_1 * factor_2] << [factor_1, factor_2].sort
  #     end
  #   end
  # end

  def find_factors
    @all_values_w_factors = Hash.new { |h,k| h[k] = [] }
    @range.to_a.repeated_combination(2) do |factor_1, factor_2|
      @all_values_w_factors[factor_1 * factor_2] << [factor_1, factor_2]
    end
  end

  def palindrome?(number)
    number == number.digits.join.to_i
  end
end

class Palindrome
  include Comparable
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end

  def <=>(other)
    @value <=> other.value
  end
end

# palindromes = Palindromes.new(max_factor: 999, min_factor: 100)
# palindromes.generate
# p palindromes.largest.value
