# 4_ex.rb

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def retrieve_age(message)
  prompt(message)
  age = ''
  loop do
    age = gets.chomp
    break if integer?(age)
    prompt('Please only enter whole numbers, please try again.')
  end
  if age.to_i <= 0
    age = retrieve_age('Please enter a number greater than 0. Please try again')
  end
  age.to_i
end

age = retrieve_age('What is your age?')
retirement_age = retrieve_age('At what age would you like to retire?')
year = Time.new.year
years_left = retirement_age - age
retirement_year = year + years_left
prompt("It's #{year}. You will retire in #{retirement_year}.")
prompt("You have only #{years_left} years of work to go!")
