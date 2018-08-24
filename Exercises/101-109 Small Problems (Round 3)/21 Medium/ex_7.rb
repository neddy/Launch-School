# ex_7.rb
# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# Example:

# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
#
# Understand the problem
# Take a string, replace all the words that are numbers with actual numbers
#
# Data
# I: string
# O: string
#
# Solution
# Create array of number words from 0 to 9
# iterate over array, replacing words in string with number word index

# First solution
def word_to_digit(string)
  numbers = %w(zero one two three four five six seven eight nine)
  numbers.each_with_index do |num, idx|
    string.gsub!(/\b#{num}\b/, idx.to_s)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# Further Exploration
def word_to_digit(string)
  numbers = %w(zero one two three four five six seven eight nine)
  # Add brackets around existing numbers, so they are not altered below.
  string.gsub!(/(\d+)/, '{{\1}}')
  numbers.each_with_index do |num, idx|
    string.gsub!(/\b#{num}\b/i, idx.to_s)
  end
  string.gsub!(/(\d)\s(?=\d)/, '\1') # Remove space between numbers
  # Formats phone numbers, ignores existing numbers of 10 or more
  # digit numbers using look ahead and behind for brackets
  string.gsub!(/(?<=\s)(\d{3})(\d{3})(\d{4})(?=\s|[[:punct:]])/, '(\1) \2-\3')
  string.gsub(/{{(\d+)}}/, '\1') # removes brackets around existing numbers
end

input = "Ph: FIVE five five one two three four two three four. Not formatted: 1000000000000 99 9 9. More numbers: one two three"
expected_output = "Ph: (555) 123-4234. Not formatted: 1000000000000 99 9 9. More numbers: 123"

p word_to_digit(input) == expected_output
