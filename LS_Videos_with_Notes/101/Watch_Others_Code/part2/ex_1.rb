# Write a method that will return a substring based on a specified indicies.

def substring(string, start, stop = nil)
  return string[start] unless stop
  string.slice(start..stop)
end

# The manual approach
# def substring(string, start, stop = nil)
#   return string[start] unless stop
#   sub_string = ''
#   string.chars.each_with_index do |char, idx|
#     sub_string << char if idx >= start && idx <= stop
#   end
#   sub_string
# end

p substring('honey', 0, 2)
p substring('honey', 1, 2)
p substring('honey', 3, 9)
p substring('honey', 2)

# Write a method that finds all substrings in a string. No 1 letter substrings

# Understand the problem
#
#
# Data
# I: string
# O: array of substrings
#
# Solution
# Start at first index
#   take two char sub string
#   then increase count to 3
#   so on to string length
# then start at index 1
#   take two char sub string
#   then increase count to 3
#   so on to string length - 1
# ...

# Algorithm
# create empty array
# set start index to 0
# max_string_length to string length
# loop string length - 1 times with index1
#   loop (2 to max_string_length) with index2
#     add substring to array from index1 to index2
#   end
#   max_string_length = max_string_length - 1
# end
# return array



def substrings(string)
  array = []
  max_string_length = string.length
  (string.size - 1).times do |idx1|
    (2..max_string_length).each do |length|
      array << string.slice(idx1, length)
    end
    max_string_length -= 1
  end
  array
end

p substrings("band")


def substrings(string)
  array = []
  max_string_length = string.length
  (string.size - 1).times do |idx1|
    ((idx1 + 1)..string.size - 1).each do |idx2|
      array << string.slice(idx1..idx2)
    end
  end
  array
end

p substrings("world")


# Create a method to return all palindromes (strings that are the same forwards and backwards).

def palindromes(string)
  array = substrings(string)
  array.select{ |word| word == word.reverse }
end

p palindromes("ppop")


# Write a method to return the largest palindromes

def largest_pal(string)
  palindromes(string).max_by{ |word| word.length }
  palindromes(string).reduce{ |longest, word| longest.size > word.size ? longest : word }
end

p largest_pal('ppop')
