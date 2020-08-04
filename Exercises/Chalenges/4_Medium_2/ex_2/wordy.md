# Wordy
Write a program that takes a word problem and returns the answer as an integer.

E.g.

What is 5 plus 13?

The program should return 18.

What is 7 minus 5 minus 1?

The program should return 1.

Remember, that these are verbal word problems, not treated as you normally would treat a written problem. This means that you calculate as you move forward each step. This means 3 + 2 * 3 = 15, not 9.

Hint: to solve this problem elegantly, you need to know how the send method works in Ruby. If you haven't seen it before, check it out here.

# The problem
Take a math problem stated in words and return the solution as an integer

# Data structure
store numbers and operators in seperate arrays

# Solution

Get array of numbers and array of operators

Iterate through each operator, preforming the operation on the numbers in the numbers array.
