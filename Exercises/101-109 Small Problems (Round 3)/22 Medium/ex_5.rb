# ex_5.rb
# Triangle Sides
# A triangle is classified as follows:
#
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
#
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
#
# Examples:

# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid
#
# Understand the problem
# take 3 integers, describing the sides of a triangle
# return the triangle type as a symbol, or :invalid
#
# A triangle is invalid if:
# any side has a length of 0 or less
# the sum of two shorter sides is less than the longest side
#
# Different types:
# equilateral = 3 sides are equal
# isosceles = 2 sides are equal
# scalene = all sides different
#
# Data
# I: 3 x integers
# O: symbol
#
# Solution
# take 3 integers,
# use case statement
# when any side <= 0 OR sum of shorter 2 sides < longest side
#   return :iunique sides == 1nvalid
# when unique sides == 1
#   return :equilateral
# when unique sides == 2
#   return :isosceles
# else
#   return :scalene
# end

def triangle(n1, n2, n3)
  sides = [n1, n2, n3].sort
  case
  when sides.any?{|side| side <= 0 }, sides[0..1].sum <= sides.last
    :invalid
  when sides.uniq.size == 1
    :equilateral
  when sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
