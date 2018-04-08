# 10_ex.rb

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(num)
  if num > 0
    integer_to_string(num).prepend('+')
  elsif num < 0
    integer_to_string(num.abs).prepend('-')
  else
    integer_to_string(num)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'


# Refactor

def signed_integer_to_string_refactor(number)
  str = integer_to_string(number.abs)
  case number <=> 0
  when -1 then "-#{str}"
  when +1 then "+#{str}"
  else         str
  end
end

puts signed_integer_to_string_refactor(4321) == '+4321'
puts signed_integer_to_string_refactor(-123) == '-123'
puts signed_integer_to_string_refactor(0) == '0'
