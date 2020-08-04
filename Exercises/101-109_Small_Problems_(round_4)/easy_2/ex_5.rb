# ex_5.rb

# Greeting a user
# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.
#
# Examples
#
# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

def greet
  puts "What is your name?"
  name = gets.chomp

  if name[-1] == "!"
    puts "HELLO #{name[0..-1].upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

greet
