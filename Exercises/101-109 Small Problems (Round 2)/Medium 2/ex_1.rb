# ex_1.rb
# Longest Sentence
# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.
#
# Example text:
#
# Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.
#
# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.
#
# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.

# Understand the problem
# Find the longest sentence in a peice of text.
# A sentence is defined ending with one of these three characters: '!' '?' '.'

# Data:
# I:string
# O:string
# A: split string into array of sentences, then array of words for each sentence

# Algorithm
# read text to variable
# split text into array, delimiting with '!' OR '?' OR '.'
# split senteces into words
# sort array with longest array last
# return longest array
# count words in longest array and store
# then join longest array back togther and output then output the longest sentence and the number of words.

def longest_sentence(file)
  text = File.read(file)
  sentences = text.split(/(?<=[?.!])/)

  sentences.sort_by!{ |sentence| sentence.split.size }
  word_count = sentences.last.split.size
  puts "The longest sentence is #{word_count} words long. Here it is:"
  puts
  puts sentences.last
end

longest_sentence('ex_1-txt1.txt')
longest_sentence('ex_1-txt2.txt')
