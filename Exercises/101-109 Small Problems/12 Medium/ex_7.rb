# ex_7.rb
# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
#
# Examples:
require 'date'

def friday_13th(year)
  total_friday_13th = []
  (1..12).each do |month|
    date = Date.new(year, month, 13)
    total_friday_13th << date if date.friday?
  end
  total_friday_13th.size
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
