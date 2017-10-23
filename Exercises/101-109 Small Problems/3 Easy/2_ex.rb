# 2_ex.rb

OPERATIONS = ['+', '-', '*', '/', '%', '**']

def prompt(message)
  puts "=> #{message}"
end

def retrieve_number(message)
  prompt(message)
  gets.chomp.to_i
end

number1 = retrieve_number('Please enter the first number.')
number2 = retrieve_number('Please enter the second number.')

OPERATIONS.each do |operation|
  result = number1.send(operation, number2)
  prompt("#{number1} #{operation} #{number2} = #{result}")
end
