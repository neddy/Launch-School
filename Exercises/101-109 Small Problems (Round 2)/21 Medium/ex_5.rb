# ex_5.rb
# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
#
# Examples
#
# diamond(1)
#
# *
# diamond(3)
#
#  *
# ***
#  *
# diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Understand the problem
# Create a diamond of stars n by n in dimensions
# each step, the number of stars increases by two,
# then at the center, it starts to decreas by two
# the start and end line are both 1 star long
#
# Data
# I: integer
# O: print diamond to screen
# A:
# Store data in array


# Algorithm / Solve Problem
# Create array of numbers depicting how many stars are on each line
# Convert array of numbers to text to output by multiplying number by stars for each element in array
# center output with spaces to create star
#
# method assending_decending(current_stars, direction)
#   if direction == up
#     n + 2
#   else
#     n - 2
#   end
# end
#
# current_stars = 1
# direction = up
# array_stars = []
# loop n times
#   if current_stars == n
#     direction = 'down'
#   end
#   array_stars << current_stars
#   current_stars = assending_decending(n, direction)
# end
#
# loop through array
#   print out the number of stars stored in each element, centered by n characters
# end

def stars(current_stars, direction)
  if direction == 'up'
    current_stars + 2
  else
    current_stars - 2
  end
end

def create_array(n)
  current_stars = 1
  direction = 'up'
  array = []
  n.times do
    array << '*' * current_stars
    direction = 'down' if current_stars == n
    current_stars = stars(current_stars, direction)
  end
  array
end

def diamond(n)
  array = create_array(n)
  array.each do |stars|
    puts stars.center(n)
  end
end

diamond(9)
