class Octal
  def initialize(input)
    @octal = valid?(input) ? input.to_i : 0
  end

  def to_decimal
    @octal.digits.each_with_index.reduce(0) do |decimal, (number, idx)|
      decimal + number * (8 ** idx)
    end
  end

  private

  def valid?(input)
    !/[^0-7]/.match(input)
  end
end

# puts Octal.new("10").to_decimal
