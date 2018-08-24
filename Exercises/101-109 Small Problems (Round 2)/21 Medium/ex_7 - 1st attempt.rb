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


def word_to_digit(string)
  array = string.split('.')
  array.map! do |sentence|
    sentence.split(' ')
  end

  array.map! do |sentence|
    sentence.map do |word|
      if NUMBERS.keys.include?(word)
        NUMBERS[word]
      else
        word
      end
    end
  end
  array.map! do |sentence|
    sentence.join(' ')
  end

  new_string = ''
  array.each do |sentence|
    new_string << sentence + '. '
  end
  new_string.strip
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
