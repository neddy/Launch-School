# ex_7.rb
# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# Example:

# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Understand the problem
# Create a method that can parse sentences and convert the words that are numbers into integers.

# Data
# I:string
# O:string
# A:arrays for split strings, and hash for numbers and number words

# Algorithm
# Split string at full stop and store each sentence seperately in an array
# split each sentence into words and store in sub arrays
# iterate over words in sub arrays and match number words and replace with numbers
# join back words and then sentences with full stops
#
# array1 = split string at '.'
# iterate over array1 and split strings at ' '
# create hash of numbers and coresponding words
# iterate over sentences
#   iterate over words
#     match number words and replace them with coresponding number
#   end
# end
# join words back together
# join sentences back with '.'
# return string


# FURTHER EXPLORATION


# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.
#
# Can you change your solution this so the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

# Algorithm
# create list of words and numbers in hash
# loop through words in hash, replacing number words
#
# split string at spaces
# loop through elements and join together without space if previous character and current character are single integer.
#
# join back together

NUMBERS = { 'zero' => '0',
            'one' => '1',
            'two' => '2',
            'three' => '3',
            'four' => '4',
            'five' => '5',
            'six' => '6',
            'seven' => '7',
            'eight' => '8',
            'nine' => '9'
          }

def single_integer?(word)
  word_no_punct = word.gsub(/[[:punct:]]/, '')
  if word_no_punct.to_i.to_s == word_no_punct
    if word_no_punct.size == 1
      return true
    end
  end
  false
end

def word_to_digit(string)
  NUMBERS.each do |word, digit|
    string.gsub!(/\b#{word}\b/, digit)
  end
  new_string = ''
  last_char_digit = false
  string.split(' ').each do |word|
    if single_integer?(word)
      if last_char_digit
        new_string = new_string[0..-2] + word + " "
      else
        new_string << word + " "
        last_char_digit = true
      end
    else
      new_string << word + " "
      last_char_digit = false
    end
  end
  new_string.strip
end

p word_to_digit('Please call me at five five five one two three four 00. Thanks.')
