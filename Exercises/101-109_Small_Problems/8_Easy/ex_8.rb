# ex_8.rb
# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.
#
# Examples:

def double_consonants(string)
  string.gsub(/([^aeiou0-9[[:punct:]]\s])/i, '\1\1')
end
puts double_consonants("HEllo -World!")

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""

# Other student solution
def double_consonants(str)
  str.gsub(/([a-z&&[^aeiou]])/i,'\1\1')
end

# Recommended Solution
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end
