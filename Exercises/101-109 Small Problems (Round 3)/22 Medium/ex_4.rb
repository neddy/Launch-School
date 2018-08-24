# ex_4.rb
# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
#
# Examples:
#
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
#
# Note that balanced pairs must each start with a (, not a ).

# Understand the problem
# find if a string has balanced parentheses.
#
# Data
# I: string
# O: boolean
#
# Solution
# create a count of open parentheses, set to 0
# add one to count for an open parentheses, subtract one for closing
# return false if count is ever negative
# return true at end if count == 0, else false

def balanced?(string)
  count = 0
  string.gsub!(/[^()]/, '')
  string.chars.each do |char|
    char == '(' ? count += 1 : count -= 1
    break if count < 0
  end
  count == 0 ? true : false
end



# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
def close_bracket_ok?(char, close, quotes)
  quotes = 0 unless quotes
  close == BRACKETS[char] && quotes.size.even?
end

def final_quotes_ok?(quotes_register)
  quotes_register.keys.size <= 1 && quotes_register[0].size.even?
end

require 'pry'
BRACKETS = { ')' => '(', ']' => '[', '}' => '{'}
def balanced?(string)
  bracket_register = []
  quotes_register = Hash.new('')
  string.gsub!(/[^(){}\[\]'"]|(?<=\w)'(?=\w)/, '')
  string.chars.each do |char|
    if BRACKETS.values.include?(char)
      bracket_register << char
    elsif BRACKETS.keys.include?(char)
      quotes = quotes_register.delete(bracket_register.size)
      return false unless close_bracket_ok?(char, bracket_register.pop, quotes)
    else
      quotes_register[bracket_register.size] += char
    end
  end
  bracket_register.empty? && final_quotes_ok?(quotes_register)
end


p balanced?("What '['test']{(is)}' 'this'?") == true
p balanced?("What ['test's']{(is)} this?") == true
p balanced?("What [test's]{(is)} this?") == true
p balanced?("What [['test's']{(is)} this?") == false
p balanced?("What [''test's']{(is)} this?") == false
