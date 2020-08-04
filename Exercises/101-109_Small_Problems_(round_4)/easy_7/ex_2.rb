# ex_2.rb

# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.
#
# Examples
#
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

def letter_case_count(string)
  counters = {}
  counters[:lowercase] = string.count("a-z")
  counters[:uppercase] = string.count("A-Z")
  counters[:neither] = string.count("^a-zA-Z")
  counters
end

puts letter_case_count('abCdef 123')
