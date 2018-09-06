# cmd_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# puts MESSAGES.inspect

def prompt(message)
  puts "=> #{message}"
end

def float?(input)
  Float(input) rescue false
end

def integer?(input)
  input.to_i.to_s == input
end

def valid_num?(input)
  integer?(input) || float?(input)
end

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['ask_first_number'])
    number1 = gets.chomp
    valid_num?(number1) ? break : prompt(MESSAGES['valid_num_error'])
  end

  number2 = ''
  loop do
    prompt(MESSAGES['ask_second_number'])
    number2 = gets.chomp
    valid_num?(number2) ? break : prompt(MESSAGES['valid_num_error'])
  end

  operation = ''
  loop do
    prompt(MESSAGES['operation_prompt'])
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(MESSAGES['valid_operator_error'])
    end
  end
  operation_message = [
    MESSAGES['adding'],
    MESSAGES['subtracting'],
    MESSAGES['multiplying'],
    MESSAGES['dividing']
  ][operation.to_i - 1]

  prompt("#{operation_message} #{MESSAGES['preforming_operation']}")

  result =  case operation
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("#{MESSAGES['result']} #{result}")

  prompt(MESSAGES['run_again_prompt'])
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
