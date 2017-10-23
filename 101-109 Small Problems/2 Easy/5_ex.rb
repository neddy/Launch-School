# 5_ex.rb

def prompt(message)
  puts "=> #{message}"
end

prompt('What is your name?')
name = gets.chomp
if name[-1] == '!'
  name = name.chop
  prompt("HELLO #{name.upcase}. WHY ARE WE SCREAMING?")
else
  prompt("Hello #{name}.")
end

=begin
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
=end
