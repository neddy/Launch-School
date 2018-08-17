# ex_5.rb
# Uppercase Check
# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(string)
  string.gsub!(/[^[[:alpha:]]]/, '')
  string.gsub(/[^[[:upper:]]]/, '') == string
end


p uppercase?('Four Score')
p uppercase?('FOUR SCORE')

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
