# ex_4.rb
# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
#
# Examples:

# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false

# Understand the problem
# Create a method to parse a string and detect if parentheses are valid and equal.

# Data
# I:string
# O:boolean
# A:string

# Algorithm
# loop iterate over string
#   add one to parantheses count for open parenthese, substract one for close paranthese
#   return false if running total is ever negative
# end loop
# return true if running total == 0, otherwise false

def balanced?(string)
  string.gsub!(/[^\(\)]/, '')
  total = 0
  string.chars.each do |paranthese|
    if paranthese == '('
      total += 1
    elsif paranthese == ')'
      total -= 1
    end
    return false if total < 0
  end
  total == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Further Exploration
# This solution can deal with parenthese, square brackets, curly brackets, and both types of quotaion marks
#
# It's a little difficult to explain what I did, but basically I made an array to register the open symbol types. When a symbol opens, I add that symbol type to the array, when a symbol closes, remove the last element in the register, and check if it's equal to the currently closing symbol type. This makes sure that one symbol cannot close when a differnt inner symbol grouping is still open.
#
# It also checks if the number of quotation marks is balanced, but is can't check if they were closed out of turn (I couldn't figure out how to do this), it only checks if the number of quotes in the string are even for each type. I also remove single apostraphes that are in the middle of words, so that single quotaion marks can be checked.

PAIRS_TO_BAL = {
                 'paranthese' => ['(', ')'],
                 'square' => ['[', ']'],
                 'curly' => ['{', '}']
               }

def balanced_quotes?(string)
  string.count('"').even? && string.count("'").even?
end

def balanced?(string)
  string.gsub!(/(?<=\w)'(?=\w)/, '')
  symbols_open = []
  string.chars.each do |char|
    PAIRS_TO_BAL.each do |type, symbols|
      symbol_index = symbols.index(char)
      if symbol_index == 0
        symbols_open << type
      elsif symbol_index == 1
        return false unless symbols_open.pop == type
      end
    end
  end

  symbols_open.size == 0 && balanced_quotes?(string)
end


p balanced?("What's (is) this?") == true
p balanced?('What {[("is")]} this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is)" this?') == false
