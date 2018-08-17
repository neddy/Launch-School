# ex_6.rb
# Tri-Angles
# A triangle is classified as follows:
#
# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
#
# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.
#
# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.
#
# Examples:

# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# Understand the problem
# take 3 measurements for the angles of a triangle, decide if triangle is valid, and if so return the triangle type.
#
# rules
# 3 angles must add up to 180
# All angles must be greater than 0
#
# right triangle: one angle == 90
# acute triangle: 3 angles less than 90
# Obtuse triangle: one angle greater than 90
#
# Data
# I: 3 numbers
# O: symbol
# A: array
#
# Algorithm
# store measurements in array
# invalid unless all measurements are greater than 0
# invalid unless 3 angles add up t0 180
# right if any angle is 90
# obtuse if any angle is greater than 90
# else return acute

def triangle(n1, n2, n3)
  angles = [n1, n2, n3]
  case
  when angles.any? { |n| n <= 0 }
    :invalid
  when angles.sum != 180
    :invalid
  when angles.include?(90)
    :right
  when angles.any? { |n| n > 90 }
    :obtuse
  else
    :acute
  end
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
