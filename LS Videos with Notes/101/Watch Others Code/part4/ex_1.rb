# Write a method that takes a string and returns the original string, but with the first letter of each word capitalised.
#
# You may assume that words are any non-blank sequence of characters, only the first character needs to be considered.
#
#
# Understand the problem
# take a string, capitalise the first character of every word, ignore the other letters in the word.
# Then return the string with capitalised words.
#
# Data
# I: string
# O: string
#
# Solution / Algorithm
# take the string, split up the words
# iterate over the words, call upcase on the first character of each word
# join the words and return the string

def word_cap(string)
  string.split.map do |el|
    el[0] = el[0].upcase
    el
  end.join(' ')
end

p word_cap('four score and seven')
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The JavaScript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
