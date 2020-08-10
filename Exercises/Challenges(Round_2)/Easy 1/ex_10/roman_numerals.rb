# ROMANS = %w(I V X L C D M)

# class Integer
#   def to_roman
#     index = 0
#     numbers = self.digits
#     roman_string = ""
#     numbers.each do |n|
#       case n
#       when (1..3)
#         roman_string.prepend(ROMANS[index] * n )
#       when 4
#         roman_string.prepend("#{ROMANS[index]}#{ROMANS[index + 1]}")
#       when (5..8)
#         roman_string.prepend("#{ROMANS[index + 1]}#{ROMANS[index] * (n - 5)}")
#       when 9
#         roman_string.prepend("#{ROMANS[index]}#{ROMANS[index + 2]}")
#       end
#       index += 2
#     end
#     roman_string
#   end
# end

ROMANS = %w(I V X L C D M)

class Integer
  def to_roman
    index = 0
    self.digits.reduce("") do |roman_string, n|
      case n
      when (1..3)
        roman_string.prepend(ROMANS[index] * n )
      when 4
        roman_string.prepend("#{ROMANS[index]}#{ROMANS[index + 1]}")
      when (5..8)
        roman_string.prepend("#{ROMANS[index + 1]}#{ROMANS[index] * (n - 5)}")
      when 9
        roman_string.prepend("#{ROMANS[index]}#{ROMANS[index + 2]}")
      end
      index += 2
      roman_string
    end
  end
end

# puts 1953.to_roman
