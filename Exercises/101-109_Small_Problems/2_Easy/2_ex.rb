# 2_ex.rb

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def retrieve_dimension(message)
  prompt(message)
  dimension = ''
  loop do
    dimension = gets.chomp
    break if integer?(dimension)
    prompt('Please only enter whole numbers, please try again.')
  end
  if dimension.to_i <= 0
    dimension = retrieve_dimension('Please enter a number greater than 0. Please try again')
  end
  dimension.to_i
end

length = retrieve_dimension('Enter the length of the room in meters:')
width = retrieve_dimension('Enter the width of the room in meters:')
area_meters = length * width
area_feet = format('%.2f', area_meters * 10.76391)
prompt("The area of the room is #{area_meters} square meters (#{area_feet} square feet).")
