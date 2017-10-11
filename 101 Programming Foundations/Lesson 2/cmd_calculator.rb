# cmd_calculator.rb

=begin
Ask user for 2 numbers
Ask user for operation to preform
preform operation on numbers
output hte result

=end


puts 'Please enter the first number:'
number1 = gets.chomp
puts 'Please enter the second number:'
number2 = gets.chomp
puts 'Please enter the operation: 1) add 2) Subtract 3) Multiply 4) Divide'
operation = gets.chomp

case operation
when '1'
  result = number1.to_i + number2.to_i
when '2'
  result = number1.to_i - number2.to_i
when '3'
  result = number1.to_i * number2.to_i
when '4'
  result = number1.to_f / number2.to_f
else
  puts 'A valid operation was not selected'
end

puts "The result is: #{result}"
