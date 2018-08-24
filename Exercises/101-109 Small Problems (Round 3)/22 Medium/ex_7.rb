# ex_7.rb
# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
#
# Examples:

# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2
#
# Understand the problem
# take a year as input, return how many friday the 13th are in that year
#
# Data
# I: integer
# O: integer
#
# Solution
# iterate over the 13th of each month in that year, count the number that are fridays

require 'date'
def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

p friday_13th(2015)
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
