# Write a method that takes an array of strings, and returns an array of the same strings values, except with the vowels removed.
#
# Data
# I: array
# O: array
# A: array
#
# Algorithm
# iterate through array transforming elements by substituting vowels for nothing.
# return transformed array




list = %w(green yellow black white)

def vowel_replace(list)
  list.map { |word| word.gsub(/[aeiou]/, '') }
end

p vowel_replace(list)
