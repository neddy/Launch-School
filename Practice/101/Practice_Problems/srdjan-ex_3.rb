=begin
Given a string, find the number character that is repeated most times and return it's numeric value. If multiple characters are repeated the same time, return first one.
If there are no numeric characters in a string return nil.
=end

# Understand the problem
# take a string, assess the numeric characters only. Find the one that repeats the most.
# If more than one chaacter repeats the same number of times, return the first one.
#
# Data
# I: string
# O: integer or nil
# A:

# Algorithm
# remove all non-numeric chars from string
#   if string length is 0 return nil
#
# uniq_numbers = uniq numbers in string as hash default value  = 1
# loop through uniq_numbers
#   store count in hash as value
# end
#
# find max value
#
# detect first number with max value
#
# return number as integer


def re_letter(string)
  numbers_string = string.gsub(/[^\d]/, '')
  return nil if numbers_string.empty?
  uniq_numbers = Hash.new(0)
  numbers_string.chars.uniq.each do |n|
    uniq_numbers[n] = numbers_string.count(n)
  end

  uniq_numbers.max_by { |n, count| count }[0].to_i
end

# p re_letter('There isn\' any number here!')
p re_letter('There isn\' any number here! 1 222 444 55 777')
p re_letter('There isn\' any number here!') == nil
p re_letter('%^&*()!') == nil
p re_letter('111222333') == 1
p re_letter('1234335521444') == 4
p re_letter('') == nil
p re_letter('011-555-333-23') == 3
p re_letter('1') == 1
p re_letter('444352893599119') == 9
p re_letter('555333111') == 5
