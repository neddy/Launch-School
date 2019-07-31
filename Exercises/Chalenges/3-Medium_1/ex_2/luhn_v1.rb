require 'pry'
class Luhn
  attr_reader :check_digit, :original_numbers

  def initialize(num, mode = :normal)
    @original_numbers = num.to_s.split('').map(&:to_i)

    if mode == :create
      create
    else
      @check_digit = original_numbers.pop
    end
  end

  def checksum
    addends.sum
  end

  def addends
    array = original_numbers.reverse.map.with_index do |num, idx|
              if idx.even?
                (num * 2) > 9 ? (num * 2) - 9 : (num * 2)
              else
                num
              end
            end
    array.reverse + [check_digit]
  end

  def create
    @check_digit = 0
    modulus = checksum % 10
    if modulus > 0
      @check_digit = 10 - modulus
    end
  end

  def number
    full_number = original_numbers + [check_digit]
    full_number.join('').to_i
  end

  def valid?
    (checksum % 10) == 0
  end

  def self.create(num)
    Luhn.new(num, :create).number
  end
end


# test_luhn = Luhn.new(8763)
# p test_luhn.check_digit
# p test_luhn.original_numbers
# p test_luhn.number
# p test_luhn.addends
# p test_luhn.checksum

# p Luhn.create(873_956)
