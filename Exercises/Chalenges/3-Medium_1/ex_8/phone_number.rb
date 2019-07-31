class PhoneNumber
  VALID_SEPARATORS_REGEX = Regexp.escape('()-. ')

  attr_reader :number

  def initialize(number_string)
    @number = clean_number(number_string)
  end

  def area_code
    number[0..2]
  end

  def to_s
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  private

  def clean_number(number_string)
    return '0000000000' if invalid_characters?(number_string)
    number_string = remove_seperators(number_string)

    if number_string.size == 10
      number_string
    elsif number_string.size == 11 && number_string[0] == '1'
      number_string[1..-1]
    else
      '0000000000'
    end
  end

  def invalid_characters?(number_string)
    !number_string.gsub(/[[[:digit:]]#{VALID_SEPARATORS_REGEX}]/, '').empty?
  end

  def remove_seperators(number_string)
    number_string.gsub(/[#{VALID_SEPARATORS_REGEX}]/, '')
  end
end

# test_number = PhoneNumber.new('(123) 456-7890')
# puts test_number.number
# puts test_number.area_code
# puts test_number
