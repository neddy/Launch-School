# ex_5.rb
# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
#
# You may (and should) use the substrings method you wrote in the previous exercise.
#
# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
#
# Examples:

def substrings_at_start(string)
  string.split("").map.with_index do |_, index|
    string[0..index]
  end
end

def substrings(string)
  string.split("").map.with_index do |_, index|
    substrings_at_start(string[index..-1])
  end.flatten
end

def palindromes(string)
  arr = substrings(string)
  arr.delete_if { |el| el.size < 2 }
  palindromes_arr = []
  arr.each do |sub_str|
    palindromes_arr << sub_str if sub_str == sub_str.reverse
  end
  palindromes_arr
end

p palindromes('abcd')
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
