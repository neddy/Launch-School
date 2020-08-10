class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 unless valid_octal?
    decimal = 0
    @octal_string.chars.reverse.each_with_index do |n, idx|
      decimal += n.to_i * (8**idx)
    end
    decimal
  end

  def valid_octal?
    @octal_string.chars.all? { |char| /[[0-7]]/.match(char) }
  end
end

puts Octal.new('10').to_decimal
