# ex_7.rb

# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# Example:
#
# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# Show Solution & Discussion


# Problem:
# Input will be a string, we need to convert all words that are numbers to their numeric form.
#
# Solution
# Split words up, the loop through each word, converting number words to integers. Will need to deal with punctuation at the end of some words.

require 'pry'

NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(string)
  new_string = string
  NUMBERS.each_with_index do |num, idx|
    new_string = new_string.gsub(/\b#{num}\b/, idx.to_s)
  end
  new_string
end


puts word_to_digit('Please call me at five five five one two three four. Thanks.')
