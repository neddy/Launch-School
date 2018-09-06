# 2_ex.rb
NUMBER_ENDINGS = {
  1 => 'st',
  2 => 'nd',
  3 => 'rd',
  4..20 => 'th'
}

def define_ending(number)
  last_2_digits = number.to_s[-2..-1].to_i
  if (1..20).include?(last_2_digits)
    ending = NUMBER_ENDINGS.select { |ending| ending === last_2_digits}.values.first
  else
    last_digit = number.to_s[-1].to_i
    ending = NUMBER_ENDINGS.select { |ending| ending === last_digit}.values.first
  end
 ending
end

def century(number)
  if number % 100 == 0
    century = (number / 100)
  else
    century = (number / 100) + 1
  end
  ending = define_ending(century)

  "#{century}#{ending}"
end

puts century(2000)
puts century(2001)
puts century(2020)

puts "\nTest below:\n\n"
puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
