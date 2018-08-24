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
# Take an odd integer, and create a diamond n rows with the widest section being n characters wide.
#
# Data
# I: integer
# O: print to screen
# A: store data in array
#
# Solution
# create an array with n elements
# iterate through array
#   add i '*' to each row, starting at 1, then increasing to n, then back to 1.
# end iteration
# print out each element in array, padded with n up to n spaces.

# Without using the center method
def diamond(n)
  diamond_rows = []
  after_center = false
  stars = 1
  n.times do
    spaces = " " * ((n - stars)/2)
    diamond_rows << spaces + ('*' * stars) + spaces
    if after_center
      stars -= 2
    else
      stars += 2
      after_center = !after_center if stars == n
    end
  end
  diamond_rows.each do |row|
    puts row
  end
end


diamond(9)

# Shorter
def diamond(n)
  diamond_rows = []
  stars = 1
  ((n/2.0).ceil).times do
    diamond_rows << '*' * stars
    stars += 2
  end
  diamond_rows += diamond_rows[0..-2].reverse
  diamond_rows.each do |row|
    puts row.center(n)
  end
end


diamond(9)

# Shorter Again
def diamond(n)
  diamond_rows = (1..n).step(2).to_a
  diamond_rows += diamond_rows[0..-2].reverse
  diamond_rows.each do |row|
    puts ('*' * row).center(n)
  end
end

diamond(9)

# Further Exploration
def hollow_diamond(n)
  diamond_rows = ['*']
  center_space = 1
  ((n/2)).times do
    diamond_rows << '*' + (' ' * center_space) + '*'
    center_space += 2
  end
  diamond_rows += diamond_rows[0..-2].reverse
  diamond_rows.each do |row|
    puts row.center(n)
  end
end

hollow_diamond(9)
