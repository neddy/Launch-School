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

# Understand the problem
# return a hash with the breakdown of uppercase, lowercase and niether


# Data
# I:string
# O:hash
# A:store totals variables
# create new hash with percentages to return

# Algorithm
# count uppercase letters
# count lowercase letters
# count neither
#
# return hash with percentages

def letter_percentages(string)
  tally = { lowercase: 0, uppercase: 0, neither: 0 }
  tally[:uppercase] = string.scan(/[[:upper:]]/).size
  tally[:lowercase] = string.scan(/[[:lower:]]/).size
  tally[:neither] = string.scan(/[^a-z]/i).size

  total = string.size.to_f

  tally.transform_values! do |count|
    (count/total)*100
  end
  tally
end

p letter_percentages('abCdef 123')

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
