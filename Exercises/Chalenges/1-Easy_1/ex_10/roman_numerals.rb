# class Integer
#   ROMAN_NUMERALS = {
#     1 => "I",
#     5 => "V",
#     10 => "X",
#     50 => "L",
#     100 => "C",
#     500 => "D",
#     1000 => "M"
#   }
#
#   def to_roman
#     roman_numeral = ""
#     digits.each_with_index do |n, idx|
#       next if n == 0
#       place_value = 1 * 10**idx
#       roman_numeral.prepend(find_roman_numeral(place_value, n))
#     end
#     roman_numeral
#   end
#
#   private
#
#   def find_roman_numeral(place_value, n)
#     raise RuntimeError, "No roman numeral for '0' or negative numbers" if n <= 0
#
#     case n
#     when (1..3)
#       ROMAN_NUMERALS[place_value] * n
#     when 4
#       ROMAN_NUMERALS[place_value] + ROMAN_NUMERALS[place_value * 5]
#     when 5
#       ROMAN_NUMERALS[place_value * 5]
#     when (6..8)
#       ROMAN_NUMERALS[place_value * 5] + ROMAN_NUMERALS[place_value] * (n - 5)
#     when 9
#       ROMAN_NUMERALS[place_value] + ROMAN_NUMERALS[place_value * 10]
#     end
#   end
# end
#
# puts 1990.to_roman

class Integer
  ROMAN_NUMERALS = {
    0 => "",
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M"
  }

  def to_roman
    roman_numeral = ""
    digits.each_with_index do |n, idx|
      place_value = 1 * 10**idx
      roman_numeral.prepend(find_roman_numeral(place_value, n))
    end
    roman_numeral
  end

  private

  def find_roman_numeral(place_value, n)
    case n
    when 4
      ROMAN_NUMERALS[place_value] + ROMAN_NUMERALS[place_value * 5]
    when 9
      ROMAN_NUMERALS[place_value] + ROMAN_NUMERALS[place_value * 10]
    else
      fives, ones = n.divmod(5)
      ROMAN_NUMERALS[place_value * 5 * fives] + ROMAN_NUMERALS[place_value] * ones
    end
  end
end

# puts 1990.to_roman
