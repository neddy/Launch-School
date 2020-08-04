# ex_1.rb

# Searching 101
# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
#
# Examples:
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

def list_check
  number_ending = { 1 => "st", 2 => "nd", 3 => "rd" }
  number_ending.default = "th"
  numbers = []
  (1..5).each do |n|
    puts "==> Enter the #{n}#{number_ending[n]} number:"
    numbers << gets.chomp.to_i
  end

  puts "Enter the last number:"
  last_number = gets.chomp.to_i

  if numbers.include?(last_number)
    puts "The number #{last_number} appears in #{numbers}."
  else
    puts "The number #{last_number} does not appear in #{numbers}."
  end
end

list_check
