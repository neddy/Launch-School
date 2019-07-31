# Phone Number

validate and clean phone numbers

Rules

- If the phone number is less than 10 digits assume that it is bad number
- If the phone number is 10 digits assume that it is good
- If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
- If the phone number is 11 digits and the first number is not 1, then it is a bad number
- If the phone number is more than 11 digits assume that it is a bad number

valid seperators in phone number () - .

# Data Structure
Clean number and store as 3 element array of numbers as strings

# Solution

Check for invalid characters, set number to 000000000 if invalid

strip out non numeric characters

test if number is 10 characters long, if it is, set as number

test if number is 11 characters long and if first number is 1, if so, set as number without 1

to_s()
return formatted number as (000) 000-0000
