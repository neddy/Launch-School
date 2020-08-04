# ex_5.rb

# Staggered Caps (Part 1)
# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.
#
# Example:
#
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# def staggered_case(string)
#   upcase_next = true
#   string.chars.map do |char|
#     swapped_char = if upcase_next
#                      char.upcase
#                    else
#                      char.downcase
#                    end
#     upcase_next = !upcase_next
#     swapped_char
#   end.join
# end
#
# puts staggered_case('I Love Launch School!')
#
# puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
# puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


# def staggered_case(string)
#   upcase_next = true
#   string.chars.map.with_index do |char, idx|
#     if idx.even?
#       char.upcase
#     else
#       char.downcase
#     end
#   end.join
# end
#
# puts staggered_case('I Love Launch School!')
#
# puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
# puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case(string)
  upcase_next = true
  string.chars.map.with_index do |char, idx|
    idx.even? ? char.upcase : char.downcase
  end.join
end

puts staggered_case('I Love Launch School!')

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
