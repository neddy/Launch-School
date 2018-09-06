# ex_2.rb
# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.
#
# Examples

def letter_case_count(string)
  lowercase_letters = string.gsub(/[^a-z]/, '')
  uppercase_letters = string.gsub(/[^A-Z]/, '')
  other_chars = string.gsub(/[a-z]/i, '')
  { lowercase: lowercase_letters.size, uppercase: uppercase_letters.size, neither: other_chars.size }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
