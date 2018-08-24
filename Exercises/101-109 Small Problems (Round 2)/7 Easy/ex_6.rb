# ex_6.rb
# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.
#
# Example:

# I: string
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
  new_string = ''
  string.chars.each do |char|
    if /[a-z]/i =~ char
      new_string << if set_upper
        char.upcase
      else
        char.downcase
      end
      set_upper = !set_upper
    else
      new_string << char
    end
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
