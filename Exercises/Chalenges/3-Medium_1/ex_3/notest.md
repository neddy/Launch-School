# Pig Latin

Rules

1. If begins with a vowel, add 'ay' to end
2. If it begins with a constant then move the constant to the end and then add 'ay'
3. Constants can be more than one letter, constants end when the next letter is a vowel

Edge cases

- 'qu' is a constant
- 'y' can be a constant when it's followed by a vowel
- 'x' can be a constant when it's followed by a vowel


# Data Structure
store words in an array
also store vowels and constants in an array as a class variable


# Solution
Loop through words and process each
- if a word starts with a vowel, add 'ay' and move on
- if a word starts with a 'y' or 'x', check if the next letter is a vowel, if so, move it to the end and add 'ay'.
- if the word begins with a constant, slice it at the first vowel, 
  - if constant ends with 'q', check if next character is a 'u', if so add this to constant.
  - move this to the end and then add 'ay'
