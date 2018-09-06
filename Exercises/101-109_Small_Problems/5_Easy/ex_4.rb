# ex_4.rb
# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.
#
# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces
#
# Examples:

def swap(string)
  arr = string.split(" ")
  arr.each do |word|
    first = word[0]
    last = word[-1]
    word[0] = last
    word[-1] = first
  end
  arr.join(" ")
end

puts swap('Oh what a wonderful day it is')

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

def swap_two(string)
  result = string.split(" ").map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  result.join(" ")
end

puts swap_two('Oh what a wonderful day it is')


# Recommended solution
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
