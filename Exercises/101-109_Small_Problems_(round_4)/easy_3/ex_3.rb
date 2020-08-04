# ex_3.rb

# Counting the Number of Characters
# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.
#
# input:
#
# Please write word or multiple words: walk
# output:
#
# There are 4 characters in "walk".
# input:
#
# Please write word or multiple words: walk, don't run
# output:
#
# There are 13 characters in "walk, don't run".

# print "Please write word or multiple words: "
# words = gets.chomp
# character_count = words.gsub(/[[:space:]]/, "").length
#
# puts "There are #{character_count} characters in \"#{words}\"."


# print "Please write word or multiple words: "
# words = gets.chomp
# character_count = words.scan(/[^[:space:]]/).length
#
# puts "There are #{character_count} characters in \"#{words}\"."


print "Please write word or multiple words: "
words = gets.chomp
character_count = words.count "^ "

puts "There are #{character_count} characters in \"#{words}\"."
