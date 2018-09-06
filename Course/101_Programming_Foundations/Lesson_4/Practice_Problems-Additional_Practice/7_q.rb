# 7_q.rb
statement = "The Flintstones Rock"

frequency = {}

statement.delete(' ').chars do |char|
  if frequency.include?(char)
    frequency[char] += 1
  else
    frequency[char] = 1
  end
end
p frequency
