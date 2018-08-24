# ex_5.rb
# Staggered Caps (Part 1)
# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.
#
# Example:

# I: String
# O: String
# F:
# Split string into characters
# create variable to contain boolean value to decide wether to change case of charater to upper or lower case, setting to uppercase first
# iterate over characters
#   evaluate boolean variable
#   Change case of character accordingly
# join characters back together.

def staggered_case(string)
  set_upper = true
  string.chars.map do |char|
    if set_upper
      set_upper = !set_upper
      char.upcase
    else
      set_upper = !set_upper
      char.downcase
    end
  end.join
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
