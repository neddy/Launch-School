# ex_2.rb
# Madlibs
# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.
#
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.
#
# Example

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
#
# Do you walk your blue dog quickly? That's hilarious!

## Understand the problem
# create a program that inserts the appropriate words at the appropriate point in a string. Get the words from user input


## Tests

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

## Data structure
# input stored as strings in a hash
# story hard coded with string interpolation


# Algorithm

# Ask for user input for the four variables
  # Loop through hash of word types and get input
# replace placeholders with input words
# print string to screen

def get_input(type)
  puts "Please input a #{type}:"
  gets.chomp
end

def madlibs()
  words = {'noun' => '', 'verb' => '', 'adjective' => '', 'adverb' => ''}
  words.each do |word, _|
    words[word] = get_input(word)
  end
  puts "Do you #{words['verb']} your #{words['adjective']} #{words['noun']} #{words['adverb']}? That's hilarious!"
end

madlibs
