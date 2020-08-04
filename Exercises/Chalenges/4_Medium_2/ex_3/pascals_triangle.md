# The problem

Create a program that creates a pascal triangle of a given number of rows

# Data

store numbers in an array of arrays, with each array being one row, and the sub arrays containing the numbers

# Solution

Start by creating an array of n elements, then populate each of this arrays with the correct number of elements for each row.

Then loop through the rows, adding the value in the same position in the previous row with the value to the left of it (i.e. index - 1). (If no value if present, add 0 in it's place...)
