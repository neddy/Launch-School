# Run Length Encoding

Write a program that preforms simple data compression. The program should replace consecutive characters with a single character and a count.

# Edge Cases / Special Considerations
Any/All characters should be encoded / decoded.

Case sensitive

Should handle unicode




# Data Structure
Input string stored as string
Encoded data also stored as string

# Solution

encode
take string and split into character groups
Then replace each group with a single character and a count, unless count is 1, in which case leave as is

decode
split string into groups of one character and any preceding numbers
replace groups of numbers and characters with n number of that character
