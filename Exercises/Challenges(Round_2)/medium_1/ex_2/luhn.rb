class Luhn
  def initialize(number)
    @input = number
  end

  def addends
    @input.digits.map.with_index do |n, idx|
      if idx.even?
        n
      else
        n > 5 ? (n * 2) - 9 : n * 2
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    new_luhn = number * 10
    if new(new_luhn).valid?
      new_luhn
    else
      valid_last_digit = 10 - (new(new_luhn).checksum % 10)
      new_luhn + valid_last_digit
    end
  end

end


# luhn = Luhn.new(8739560)
# p luhn.addends # [1, 4, 1, 4, 1]
# puts luhn.checksum

# luhn = Luhn.new(8_739_567)
# puts luhn.checksum # 22
# puts luhn.valid?

 # puts Luhn.create(873_956) # 8_739_567
