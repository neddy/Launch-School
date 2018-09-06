# ex_7.rb
# Neutralizer
# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

# Answer: The neutralize method is mutating the words array whilst trying to iterate through it, causing unexpected results as items are being deleted from the array as the each method tries to iterate through it.

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Fixed below

def neutralize(sentence)
  words = sentence.split(' ')
  ok_words = words.select do |word|
    !negative?(word)
  end

  ok_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
