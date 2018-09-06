# 8_ex.rb
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

def string_to_integer(str)
  place = 1
  number = 0
  str.split('').reverse.each do |char|
    number += NUMBERS[char] * place
    place *= 10
  end
  number
end

def string_to_signed_integer(str)
  if NUMBERS.has_key?(str[0])
    string_to_integer(str)
  elsif str[0] == '+'
    string_to_integer(str[/\d+/])
  else
    -string_to_integer(str[/\d+/])
  end
end


puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
