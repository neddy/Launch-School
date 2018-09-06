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

# Understand the problem
# Create a method that checks if three numbers passed to a method can construct a valid triangle, and if so, return the type of triange.
#
# Rules:
# sum of two shorter sides must be greater than longer side
# no side can be zero
#
# Types:
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length

# Data
# I:3 integers
# O:symbol
# A: store 3 integers in array

# Algorithm
# store 3 values in array
# sort array by value
#
# test if any values are zero or less
# test if sum of two smaller sides is less than largest side
# return false if either of the above conditions are met
#
# get unique values from array, and then test length of array
# if size == 3
#   scalene
# else size == 2
#   isosceles
# else
#   equilateral
# end

def triangle(n1, n2, n3)
  measurements = [n1, n2, n3].sort
  case
  when measurements.any?{ |n| n <= 0 }
    :invalid
  when measurements[0..1].sum <= measurements[2]
    :invalid
  when 3 == measurements.uniq.size
   :scalene
  when 2 == measurements.uniq.size
   :isosceles
  when 1 == measurements.uniq.size
   :equilateral
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
