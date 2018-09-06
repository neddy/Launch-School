# ex_5.rb
# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
#
# You may (and should) use the substrings method you wrote in the previous exercise.
#
# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
#
# Examples:
#
# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
#
# Understand the problem
# return all occurences of strings in which their reverse is equal to the original string
# do this for all substrings of two or more characters. Case is important.
#
# Data Structure
# I: string
# O: array
# A:
# array of palidromes
# store all substrings in an array
#
# Algorithm
# find all substrings of string using method from previous ex
# iterate over array of substrings
#   skip single characters
#   test if substring is equal to it's reverse
#   add palindromes to array
# return array of palindromes

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

def palindromes(string)
  substrings_array = substrings(string)
  palindromes_array = []
  substrings_array.each do |substring|
    next if substring.size < 2
    palindromes_array << substring if substring == substring.reverse
  end
  palindromes_array
end


p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
