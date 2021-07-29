# require 'pry'

ROMANS = [["I", "V", "X"], ["X", "L", "C"], ["C", "D", "M"], ["M"]]

class RomanNumeral

  def initialize(number)
    unless number.between?(1, 3999)
      raise ArgumentError, "Can only compute numbers between 1 - 3999"
    end

    @number = number
  end

  def to_roman
    roman = ""
    @number.digits.each_with_index do |digit, idx|
      case digit
      when 1, 2, 3
        roman.prepend(ROMANS[idx][0] * digit)
      when 4
        roman.prepend(ROMANS[idx][0] + ROMANS[idx][1])
      when 5, 6, 7, 8
        roman.prepend(ROMANS[idx][1] + (ROMANS[idx][0] * (digit - 5)))
      when 9
        roman.prepend(ROMANS[idx][0] + ROMANS[idx][2])
      end
    end
    roman
  end
end


# # Given solution modified to not rely on the order of the `ROMAN_NUMERALS` hash
# class RomanNumeral
#   attr_accessor :number
#
#   ROMAN_NUMERALS = {
#     "I" => 1,
#     "IV" => 4,
#     "V" => 5,
#     "IX" => 9,
#     "X" => 10,
#     "XL" => 40,
#     "L" => 50,
#     "XC" => 90,
#     "C" => 100,
#     "CD" => 400,
#     "D" => 500,
#     "CM" => 900,
#     "M" => 1000
#   }
#
#   def initialize(number)
#     @number = number
#   end
#
#   def to_roman
#     roman_version = ''
#     to_convert = number
#
#     sorted_romans = ROMAN_NUMERALS.to_a.sort_by { |_, value| value }.reverse
#
#     sorted_romans.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end

# puts RomanNumeral.new(4999).to_roman
