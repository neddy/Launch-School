# ex_9.rb
# ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.
#
# Examples:

def crunch(string)
  string.gsub(/([a-z0-9])\1+/, "\\1")
end


puts crunch('ddaaiillyy ddoouubbllee')
puts crunch('4444abcabccba')

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

def crunch(string)
  string.gsub(/(\w)\1+/, "\\1")
end

puts crunch('ddaaiillyy ddoouubbllee')
puts crunch('4444abcabccba')

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
