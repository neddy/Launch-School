# ex_4.rb
# Swap Case
# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
#
# You may not use String#swapcase; write your own version of this method.
#
# Example:
# I: String
# O: String
# F:
# Split string into characters
# Iterate through characters
#   if lowercase
#     convert to uppercase
#   else
#     convert to lowercase
# join characters back together and return

def swapcase(string)
  characters = string.split('')
  characters.map! do |char|
    if char.upcase.match(char)
      char.downcase
    else
      char.upcase
    end
  end.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


def swapcase(string)
  string.chars.map do |char|
    char == char.downcase ? char.upcase : char.downcase
  end.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
