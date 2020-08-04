# ex_5.rb
#

# Reverse It (Part 1)
# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.
#
# Examples:
#
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
#
# The tests above should print true.

def reverse_sentence(phrase)
  words = phrase.split(" ")
  words.reverse!
  words.join(" ")
end


puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
