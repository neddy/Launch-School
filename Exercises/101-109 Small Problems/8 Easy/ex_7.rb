# ex_7.rb
# Double Char (Part 1)
# Write a method that takes a string, and returns a new string in which every character is doubled.
#
# Examples:

def repeater(string)
  string.gsub(/(.)/, "\\1\\1")
end

puts repeater('Hello World!')
puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''

# Recommended Solution
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end
