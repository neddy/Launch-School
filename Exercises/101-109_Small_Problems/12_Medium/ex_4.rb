# ex_4.rb
# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
#
# Examples:

def balanced?(string)
  open_parentheses = 1
  close_parentheses = -1
  tally = 0
  parentheses = string.gsub(/[^\(\)]/, '')
  parentheses.chars do |char|
    if char == "("
      tally += open_parentheses
    elsif char == ")"
      tally += close_parentheses
    end
    return false if tally < 0
  end
  tally == 0 ? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
