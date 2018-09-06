# 6_q.rb
# Starting with the string:
# famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."
puts "Four score and " + famous_words
famous_words.prepend("Four score and ")
puts famous_words

famous_words = "seven years ago..."
puts "Four score and " << famous_words
