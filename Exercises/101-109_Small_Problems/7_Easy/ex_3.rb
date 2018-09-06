# ex_3.rb
# Capitalize Words
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.
#
# You may assume that words are any sequence of non-blank characters.
#
# Examples

def word_cap(string)
  string.split(" ").map do |word|
    word.capitalize
  end.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# We can also write this more succinctly as:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# Discussion
# In the second solution, (&:method_name) is shorthand notation for { |item| item.method_name }. Thus, &:capitalize translates to:
# do |word|
#   word.capitalize
# end
# We can use this shorthand syntax with any method that has no required arguments.

def word_cap(words)
  words.split.map do |word|
    word.downcase.gsub(/^[a-z]/) {|letter| letter.upcase}
  end.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
