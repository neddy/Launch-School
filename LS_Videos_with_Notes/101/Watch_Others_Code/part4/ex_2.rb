# Write a method that returns the number of Friday the 13th in a year passed as an argument.
# You may assume that the year is greater than 1752, you may assume the the same calendar  will remain in use for the forseable future
#
# Hints:
# ruby's 'Date' class will be helpful here.
# - look at how to initialize a data
# - look at the 'friday?' method

# Understand the problem
# take an input of a year, return the number of friday the 13ths in that year
#
# Data
# I: year as integer
# O: integer
#
# Algorithm
# loop through months, checking if the 13th of each month is a friday?
# count the fridays
require 'date'

def friday_13ths(year)
  (1..12).count do |month|
    Date.new(year, month, 13).friday?
  end
end

# Examples

p friday_13ths(2015) == 3
p friday_13ths(1986) == 1
