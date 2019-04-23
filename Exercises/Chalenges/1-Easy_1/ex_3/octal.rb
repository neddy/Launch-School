class Octal
  def initialize(n)
    @num_string = n
  end

  def to_decimal
    return 0 unless valid_octal?
    exponent = @num_string.size - 1
    integer_array = @num_string.split('').map(&:to_i)

    integer_array.reduce(0) do |sum, i|
      decimal = (8 ** exponent) * i
      exponent -= 1
      sum + decimal
    end
  end

  def valid_octal?
    @num_string.gsub(/[^0-7]/, '') == @num_string
  end
end

# p Octal.new("17").to_decimal

# class Octal
#   def initialize(n)
#     @num_string = n
#   end
#
#   def to_decimal
#     return 0 unless valid_octal?
#     integer_array = @num_string.split('').map(&:to_i)
#
#     integer_array.reverse.each_with_index.reduce(0) do |sum, (i, exponent)|
#       sum + (8 ** exponent) * i
#     end
#   end
#
#   def valid_octal?
#     @num_string.gsub(/[^0-7]/, '') == @num_string
#   end
# end

# p Octal.new("17").to_decimal
