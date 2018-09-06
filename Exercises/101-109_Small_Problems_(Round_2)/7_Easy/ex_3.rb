# ex_3.rb
# Capitalize Words
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.
#
# You may assume that words are any sequence of non-blank characters.
#

# I: String
# O: String
# F:
# Split string into array of words
# Capitalize the first character of each string in array
# Join array back together and return it

# Examples

def word_cap(string)
  words = string.split(" ")
  words.map! do |word|
    word.capitalize
  end
  words.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
