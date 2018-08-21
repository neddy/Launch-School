# ex_3.rb
# What is your favourite day of the week? Check if it's the most frequent day of the week in the year.

# You are given a year as integer (e. g. 2001). You should return the most frequent day(s) of the week in that year. The result has to be a list of days sorted by the order of days in week (e. g. ['Monday', 'Tuesday']). Week starts with Monday.
#
# Input: Year as an int.
#
# Output: The list of most frequent days sorted by the order of days in week (from Monday to Sunday).
#
# Preconditions: Year is between 1 and 9999. Week starts with Monday. Calendar is Gregorian.
#
# Example:

# most_frequent_days(2427) == ['Friday']
# most_frequent_days(2185) == ['Saturday']
# most_frequent_days(2860) == ['Thursday', 'Friday']
#
# Understand the problem
# take a year as input
# return the most frequent day or days of the year (if two or more days have the same number in a year)
#
# Data
# I: integer (year)
# O: array (days)
#
# Algorithm
#
# iterate through each day of the year, adding to the counter of each day of the week as it goes.
#
# Then get the maximum count
# return all days with maximum count

# require 'date'
# def most_frequent_days(year)
#   day_names = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
#   days_count = Hash.new(0)
#   day = Date.new(year)
#   loop do
#     days_count[day.wday] += 1
#     day = day.next
#     break if day.year != year
#   end
#   maximum = days_count.values.max
#   days_count.select { |_, v| v == maximum }.keys.map{ |day| day_names[day] }
# end
#
# p most_frequent_days(1084)
#
# p most_frequent_days(2427) == ['Friday']
# p most_frequent_days(2185) == ['Saturday']
# p most_frequent_days(2860) == ['Thursday', 'Friday']
require 'pry'
require 'date'
def most_frequent_days(year)
  day_names = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
  days_count = {}
  7.times{ |i| days_count[i] = 0 }
  days_count = days_count.to_a.rotate.to_h
  day = Date.new(year, 1, 1,  Date::GREGORIAN)
  days_count[day.wday] += 1
  loop do
    day = day.next
    break if day.year != year
    days_count[day.wday] += 1
  end
  maximum = days_count.values.max
  days_count.select { |_, v| v == maximum }.keys.map{ |day| day_names[day] }
end

p most_frequent_days(2427)
p most_frequent_days(2427) == ['Friday']
p most_frequent_days(2185) == ['Saturday']
p most_frequent_days(2860) == ['Thursday', 'Friday']
p most_frequent_days(1084)
p most_frequent_days(1492)
p most_frequent_days(1)
p most_frequent_days(212)
p most_frequent_days(900)
p most_frequent_days(2427) == ['Friday']
p most_frequent_days(2185) == ['Saturday']
p most_frequent_days(2860) == ['Thursday', 'Friday']


# Note, I could not pass this Kata, dates before 1752 went a bit weird, couldn't figure it out. I think it's a cobination of the different calendars and leap years, or maybe just one of those...
