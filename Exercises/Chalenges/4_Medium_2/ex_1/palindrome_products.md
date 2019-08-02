# The problem

Find palindrome products in a given range.

return an object that contains the palindrome products for a given range. This object should be able to return the largest or smallest palindrome, and the largest or smallest factors of those palindromes. Use a struct for this.

# Data structure

Store palindromes in a hash, withe the key as the product, and it's factors in an array of arrays, with each sub array being a set of factors.

# Solution 

Create range from smallest to largest factor

Find all combinations of factors

Find all products of factors

keep factors that form palindromes

store palindromes and factors in hash


test for palindrome
  if number is the same as the number reversed
