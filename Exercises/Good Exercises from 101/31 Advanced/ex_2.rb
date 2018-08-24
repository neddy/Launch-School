# Seeing Stars
# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.
#
# Examples
#
# star(7)
#
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
# star(9)
#
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *


# Understand the problem
# Make a star with n rows
# the middle row should be all '*' characters
# the other rows should have 3 '*' divided by equal spaces, decreasing by 2 each row.
#
# Data
#
#
# Solution
# Create the first half of the array, then reverse it and remove the middle row and add to the start
# to create the first half star:
# set spaces to (n - 3) / 2
# create empty array
# loop (n / 2)times
#   add 3 stars to array, seperated by spaces
#   subtract 2 from spaces
# end
# array = array + n * '*' + array.reverse

def star(n)
  star_array = []
  ((n - 3) / 2).downto(0) do |spaces|
    star_array << "*" + (" " * spaces) + "*" + (" " * spaces) + "*"
  end
  star_array = star_array + ["*" * n] + star_array.reverse
  star_array.each{ |row| puts row.center(n) }
end

star(9)

def star(n)
  star_array = []
  ((n - 3) / 2).downto(0) do |spaces|
    star_array << %w(* * *).join(" " * spaces)
  end
  star_array = star_array + ["*" * n] + star_array.reverse
  star_array.each{ |row| puts row.center(n) }
end

star(9)
