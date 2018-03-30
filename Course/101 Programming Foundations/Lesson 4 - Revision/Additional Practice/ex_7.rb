# ex_7.rb
# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
hash = {}
statement.split.join.downcase.chars.each do |char|
  hash[char] = statement.downcase.count(char)
end

p hash

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result
