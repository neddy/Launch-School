# 1_ex.rb

def display_age(name = 'Teddy')
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

display_age()
display_age('Ned')
