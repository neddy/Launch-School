# ex_10.rb
# The End Is Near But Not Here
# Write a method that returns the next to last word in the String passed to it as an argument.
#
# Words are any sequence of non-blank characters.
#
# You may assume that the input String will always contain at least two words.
#
# Examples:

def penultimate(string)
  string.split(" ")[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

# Further Exploration
# edge cases:
# even number of words, in this case take the lower index number i.e. in a 4 element array, take the element at index 1
# only one word provided, in this case return the word

def penultimate(string)
  index = if string.split(" ").size.odd?
    (string.split.size/2.0).floor
  else
    (string.split.size/2) - 1
  end
  string.split(" ")[index]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'School'
p penultimate('last') == 'last'
p penultimate('Launch School is great, this is an odd test!') == 'this'
