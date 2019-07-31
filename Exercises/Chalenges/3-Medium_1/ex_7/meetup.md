# Meetup

Write a program that can calculate the meetup date. The program should take a month and a year, then a day of the week and a criteria for selecting the day.

The criteria are:
first
second
third
fourth
last
teenth

# Data structure
Store year and month as date object
symbols to select day preference

# Solution
Create a date object from the the entered month and year

Write a method to find each date type

teenth()
Loop from 13th to 19th of month and stop when correct day is found

first()
start from 1st and increment day by 1 until day is found

second()
start from 1st and increment day by 1 until second occurrence of day is found

third()
...

fourth()
...

last()
start with last day of month and move backwards through days until correct day is found.
