class PhoneNumber
  attr_reader :number

  def initialize(number)
    @number = '0000000000'
    self.number = number
  end

  def number=(number)
    @number = clean_number(number) if valid_number?(number)
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..9]}"
  end

  private

  def clean_number(number)
    clean_number = number.gsub(/[^0-9]/, '')
    clean_number.gsub(/\A1(?=\d{10})/, '')
  end

  def valid_number?(number)
    return false if /[^0-9\.\(\)\-\s]/.match(number)
    clean_number(number).size == 10
  end
end


# puts PhoneNumber.new('555 123 4567')
    # assert_equal '0000000000', number
