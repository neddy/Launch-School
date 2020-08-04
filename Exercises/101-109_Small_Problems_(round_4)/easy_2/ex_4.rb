# ex_4.rb

# When will I Retire?
# Build a program that displays when the user will retire and how many years she has to work till retirement.
#
# Example:
#
# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

def retirment_calculator
  puts "What is your age?"
  age = gets.chomp.to_i
  puts "At what age would you like to retire?"
  retirement_age = gets.chomp.to_i

  current_year = Time.now.year

  years_left = retirement_age - age

  puts "It's #{current_year}. You will retire in #{current_year + years_left}."
  puts "You have only #{years_left} years of work to go!"
end

retirment_calculator
