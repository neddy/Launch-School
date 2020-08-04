# ex_1.rb

# How old is Teddy?
# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.
#
# Example Output
#
# Teddy is 69 years old!

def teddy
  age = (20..200).to_a.sample
  puts "Teddy is #{age} years old!"
end

teddy
