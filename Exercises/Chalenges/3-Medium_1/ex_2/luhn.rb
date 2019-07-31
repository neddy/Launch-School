class Luhn

  def initialize(num)
    @numbers = num.to_s.split('').map(&:to_i)
  end

  def checksum
    addends.sum
  end

  def addends
    array = numbers.reverse.map.with_index do |num, idx|
              if idx.odd?
                (num * 2) > 9 ? (num * 2) - 9 : (num * 2)
              else
                num
              end
            end
    array.reverse
  end

  def number
    numbers.join('').to_i
  end

  def valid?
    (checksum % 10) == 0
  end

  def self.create(num)
    new_luhn = Luhn.new(num * 10)
    unless new_luhn.valid?
      modulus = new_luhn.checksum % 10
      new_number = new_luhn.number + (10 - modulus)
      new_luhn = Luhn.new(new_number)
    end
    new_luhn.number
  end

  private

  attr_reader :numbers
end

# test_luhn = Luhn.new(8763)
# p test_luhn.number
# p test_luhn.addends
# p test_luhn.checksum
#
# p Luhn.create(873_956)
