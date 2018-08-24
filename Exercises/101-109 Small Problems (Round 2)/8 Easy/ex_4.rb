# ex_4.rb
# All Substrings
# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
#
# You may (and should) use the substrings_at_start method you wrote in the previous exercise:
#
# Examples:

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

def substrings_at_start(string)
  substrings = []
  string.chars.each_with_index do | _, idx |
    substrings << string.slice(0..idx)
  end
  substrings
end

def substrings(string)
  substring_array = []
  0.upto(string.size - 1) do |n|
    substring_array << substrings_at_start(string[n..-1])
  end
  substring_array.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
