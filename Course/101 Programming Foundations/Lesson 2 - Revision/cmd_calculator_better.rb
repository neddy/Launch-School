# cmd_calculator.rb

=begin
Ask user for 2 numbers
Ask user for operation to preform
preform operation on numbers
output hte result
=end

def prompt(message)
  puts"=> #{message}"
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  Float(num) rescue false
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

name = ""
prompt("Welcome to calculator. Please enter your name.")
loop do
  name = gets.chomp
  !name.empty? ? break : prompt("Please enter your name")
end

loop do
  prompt("Thanks for using the calculator #{name}")
  number1 = ""
  loop do
    prompt('Please enter the first number:')
    number1 = gets.chomp
    valid_number?(number1) ? break : prompt("That doesn't look like a valid number")
  end

  number2 = ""
  loop do
    prompt('Please enter the second number:')
    number2 = gets.chomp
    valid_number?(number2) ? break : prompt("That doesn't look like a valid number")
  end

  operator_prompt = <<-MSG
Please enter the operation:
  1) add
  2) Subtract
  3) Multiply
  4) Divide
  MSG
  prompt(operator_prompt)

  operation = ""
  loop do
    operation = gets.chomp
    %w(1 2 3 4).include?(operation) ? break : prompt("You must choose 1, 2, 3 or 4")
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result =  case operation
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            else
              prompt('A valid operation was not selected')
            end

  prompt("The result is: #{result}")
  prompt("Would you like to preform another calculation? (Y to continue)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for using the calculator #{name}. Good bye!")
