# 3_q.rb

def factors_new(number, dividend = number)
  divisors = []
  if dividend > 0
    divisors << number / dividend if number % dividend == 0
    divisors << factors_new(number, dividend - 1)
  end
  divisors
end

puts factors_new(10)
