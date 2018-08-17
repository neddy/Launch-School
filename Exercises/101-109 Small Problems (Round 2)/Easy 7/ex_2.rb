# ex_2.rb
# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.
#
# Examples

# I: String
# O: Hash
# F:
# Count lowercase letters
# Count uppercase letters
# Count other letters
# Create hash and return it

def letter_case_count(string)
  lowercase = string.gsub(/[^a-z]/, '').size
  uppercase = string.gsub(/[^A-Z]/, '').size
  neither = string.gsub(/[a-z]/i, '').size
  { lowercase: lowercase,
  uppercase: uppercase,
  neither: neither}
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
