# 8_ex.rb

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def retrieve_integer(message)
  prompt(message)
  input = ''
  loop do
    input = gets.chomp
    break if integer?(input)
    prompt('Please only enter whole numbers, please try again.')
  end
  if input.to_i <= 0
    input = retrieve_integer('Please enter a number greater than 0. Please try again')
  end
  input.to_i
end

def calculate_product(number)
  (1..number).inject { |product, n| product * n}
end

def calculate_sum(number)
  (1..number).inject { |sum, n| sum + n}
end

number = retrieve_integer('Please enter an integer greater than 0:')
prompt("Enter 's' to compute the sum, 'p' to compute the product.")
loop do
  operation = gets.chomp.downcase
  case operation
  when 's'
    sum = calculate_sum(number)
    prompt("The sum of the integers between 1 and #{number} is #{sum}.")
    break
  when 'p'
    product = calculate_product(number)
    prompt("The product of the integers between 1 and #{number} is #{product}.")
    break
  else
    prompt("Please only enter either 's' or 'p'. Try again")
  end
end
