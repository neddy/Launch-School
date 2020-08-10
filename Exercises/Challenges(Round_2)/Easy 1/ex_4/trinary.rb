class Trinary
  BASE = 3

  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    return 0 unless valid_trinary?
    decimal = 0
    @trinary_string.chars.reverse.each_with_index do |n, idx|
      decimal += n.to_i * (BASE**idx)
    end
    decimal
  end

  def valid_trinary?
    @trinary_string.chars.all? { |char| /[[0-7]]/.match(char) }
  end
end

# puts Trinary.new('10').to_decimal
