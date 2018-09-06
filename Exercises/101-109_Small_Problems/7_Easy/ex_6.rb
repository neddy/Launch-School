# ex_6.rb
# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.
#
# Example:

def staggered_case(string, first_char = "upcased", special_chars = "ignore")
  upcase_current = first_char == "downcased" ? false : true
  count_special_chars = special_chars == "ignore" ? false : true
  string.chars.map do |char|
    if char.match(/[a-z]/i) || count_special_chars
      char = upcase_current ? char.upcase : char.downcase
      upcase_current = !upcase_current
      char
    else
      char
    end
  end.join
end

p staggered_case('I Love Launch School!')
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('ALL CAPS', "upcased", "dont_ignore") == 'AlL CaPs'
