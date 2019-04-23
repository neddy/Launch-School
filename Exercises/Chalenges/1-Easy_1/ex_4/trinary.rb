class Trinary
  INVALID_CHARS_PATTERN = /[^0-2]/
  BASE = 3

  def initialize(n)
    @num_string = n
  end

  def to_decimal
    return 0 unless valid_trinary?
    integer_array = @num_string.split('').map(&:to_i)

    integer_array.reverse.each_with_index.reduce(0) do |sum, (i, exponent)|
      sum + (BASE ** exponent) * i
    end
  end

  private

  def valid_trinary?
    !(@num_string =~ INVALID_CHARS_PATTERN)
  end
end


# p Trinary.new("102012").to_decimal
