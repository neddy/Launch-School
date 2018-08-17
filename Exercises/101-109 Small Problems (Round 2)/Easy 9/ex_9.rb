# ex_9.rb
# Grade book
# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
#
# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# Understand the problem
# take three grades as input
# return the letter grade of the average
#
# Data
# I: 3 integers
# O: string
# A: hash to store grades


GRADES = {
  (90..1000) => 'A',
  (80..89) => 'B',
  (70..79) => 'C',
  (60..69) => 'D',
  (0..59) => 'F'
}

def get_grade(*scores)
  average = scores.reduce(:+)/scores.size
  GRADES.select do |range, _|
    range.include?(average)
  end.values.join
end


p get_grade(95, 90, 93)
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
