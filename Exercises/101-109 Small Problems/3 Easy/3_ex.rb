# 3_ex.rb

def prompt(message)
  puts ">> #{message}"
end

def count_chars(string)
  words = string.delete(' ').length
end

prompt("Please write word or multiple words:")
input = gets.chomp

chars = count_chars(input)
prompt("There are #{chars} characters in \"#{input}\".")
