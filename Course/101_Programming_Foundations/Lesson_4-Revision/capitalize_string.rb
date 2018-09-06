str = "joe's favorite color is blue"
words = str.split(' ')
words.each do |word|
  word[0] = word[0].upcase
end

str = words.join(' ')

puts str
