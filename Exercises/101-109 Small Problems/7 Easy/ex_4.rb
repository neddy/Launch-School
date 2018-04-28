# ex_4.rb
# Swap Case
# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
#
# You may not use String#swapcase; write your own version of this method.
#
# Example:

def swapcase(string)
  string.chars.map do |char|
    if char.match(/[a-z]/)
      char.upcase
    else
      char.downcase
    end
  end.join("")
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase('Tonight on XYZ-TV')
