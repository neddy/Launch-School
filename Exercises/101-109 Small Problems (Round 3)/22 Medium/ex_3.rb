# ex_3.rb
# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.
#
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
#
# You may assume that the string will always contain at least one character.
#
# Examples

# letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
#
# Understand the problem
# Take a string, then return a hash with the percentages for each type of character
#
# Data
# I: string
# O: hash
#
#
# Solution
# count each type
# return hash with (type/total) * 100 for each type


def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0}
  counts[:lowercase] = string.gsub(/[^a-z]/, '').size
  counts[:uppercase] = string.gsub(/[^A-Z]/, '').size
  counts[:neither] = string.gsub(/[a-z]/i, '').size
  counts.map{ |key, count| [key, (count/string.size.to_f) * 100] }.to_h
end

p letter_percentages('abCdef 123')
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
