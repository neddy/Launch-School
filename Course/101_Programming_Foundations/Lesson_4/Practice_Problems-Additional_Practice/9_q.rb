# 9_q.rb

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end
words = "the flintstones rock"

puts titleize(words)
