# ex_6.rb

# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.
#
# Example:
#
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case(string)
  upcase_next = true
  string.chars.map do |char|
    if char =~ /[a-zA-Z]/ && upcase_next
      upcase_next = !upcase_next
      char.upcase
    elsif char =~ /[a-zA-Z]/
      upcase_next = !upcase_next
      char.downcase
    else
      char
    end
  end.join
end

puts staggered_case('I Love Launch School!')


puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
