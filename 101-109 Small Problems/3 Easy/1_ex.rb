# 1_ex.rb

NUMBER_OF_ENTRIES = ['1st', '2nd', '3rd', '4th', '5th', 'last']

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def retrieve_number(message)
  prompt(message)
  number = ''
  loop do
    number = gets.chomp
    break if integer?(number)
    prompt('Please only enter numbers, please try again.')
  end
  number.to_i
end

numbers = []
NUMBER_OF_ENTRIES.each do |n|
  numbers << retrieve_number("Enter the #{n} number:")
end

last_number = numbers.pop

if numbers.include?(last_number)
  prompt("The number #{last_number} appears in #{numbers}")
else
  prompt("The number #{last_number} does not appears in #{numbers}")
end
