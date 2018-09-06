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
#
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# Understand the problem
# take 3 numbers, the angles of a triangle. Determine if the triangle is valid, and if so, what type it is.
#
# A triangle is invalid if:
# 3 angles do not add up to 180 degrees
# any angle is <= 0
#
# Different types are
# right if one angle is equal to 90
# acute if all angles are less that 90
# obtuse if one angle is greater than 90
#
# Data
# I: 3 x integers
# O: symbol
#
# Solution
# return :invalid if:
#   3 angles do not add up to 90
#   any angle is 0 degrees or less
# else return type:
#   any angle == 90
#     :right
#   any angle > 90
#     :obtuse
#   else
#     :acute


def triangle(n1, n2, n3)
  angles = [n1, n2, n3]
  case
  when angles.sum != 180, angles.any?{ |angle| angle <= 0 }
    :invalid
  when angles.include?(90)
    :right
  when angles.any?{ |angle| angle > 90 }
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
