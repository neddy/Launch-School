# 3_ex.rb

def prompt(message)
  puts "=> #{message}"
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number(message)
  prompt(message)
  number = ''
  loop do
    number = gets.chomp
    break if float?(number)
    prompt('Please only enter numbers, please try again.')
  end
  if number.to_i <= 0
    number = number('Please enter a number greater than 0. Please try again')
  end
  number.to_f
end

amount = number('What is the bill?')
rate = number('What is the tip percentage?')
tip = (amount * (rate / 100)).round(2)
total = amount + tip

prompt("The tip is $#{format('%.2f', tip)}")
prompt("The total is $#{format('%.2f', total)}")
