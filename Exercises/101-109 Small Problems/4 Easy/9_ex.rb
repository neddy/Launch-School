# 9_ex.rb
require 'pry'
NUMBERS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def integer_to_string(int)
  str = ''
  if !NUMBERS.value?(int)
    places = Math.log10(int).floor
    (1..places).reverse_each do |i|
      num = int / 10**i
      str << NUMBERS.key(num)
      int -= (num * 10**i)
    end
  end
  str << NUMBERS.key(int)
  str
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'


# Suggested solution

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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
