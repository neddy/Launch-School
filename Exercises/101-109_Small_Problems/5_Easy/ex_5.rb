# ex_5.rb
# Clean up the words

# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).
#
# Examples:

def cleanup(string)
  result = string.gsub(/[^a-z]/i, ' ')
  result.gsub(/\s+/, ' ')
  # suggested solution below
  # text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
