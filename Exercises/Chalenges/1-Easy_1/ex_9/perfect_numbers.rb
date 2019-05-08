class PerfectNumber
  def self.classify(num)
    raise RuntimeError, "Number less than or equal to 0." if num <= 0

    sum_of_factors = (1...num).reduce do |sum, n|
                       num % n == 0 ? sum + n : sum
                     end
                     
    case sum_of_factors
    when (0...num) then "deficient"
    when num then "perfect"
    else "abundant"
    end
  end
end

# puts PerfectNumber.classify(20)
