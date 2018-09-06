# ex_10.rb
# Right Triangles

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.
#
# Examples:

def triangle(num)
  count = 1
  while count <= num do
    stars = "*" * count
    puts "#{(stars.rjust(num))}"
    count += 1
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

def triangle(num, side="right", point_at="top")
  count = 1
  while count <= num do
    stars = if point_at == "top"
      "*" * count
    else
      "*" * (num - (count - 1))
    end
    if side == "right"
      puts "#{(stars.rjust(num))}"
    else
      puts "#{(stars.ljust(num))}"
    end
    count += 1
  end
end

triangle(5, "left", "top")
# *
# **
# ***
# ****
# *****

triangle(5, "right", "top")
#     *
#    **
#   ***
#  ****
# *****

triangle(5, "left", "bottom")
# *****
# ****
# ***
# **
# *

triangle(5, "right", "bottom")
# *****
#  ****
#   ***
#    **
#     *
