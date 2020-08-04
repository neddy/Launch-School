# ex_5.rb

# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
#
# Examples
#
# diamond(1)
#
# *
# diamond(3)
#
#  *
# ***
#  *
# diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *



# ### Understand the Problem
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)
#
# Create a diamond of '*' that is n wide at widest point, and then reduces by 2 '*' each level, until a point on each side is reached.
#
#
# ### Examples / Test Cases
# (Input / Output, Edge Cases? Bad input?)
#
#
#
#
# ### Data Structures
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)
#
# Store number of '*' in an array as integers. i.e. [1,3,5,7,9,7,5,3,1] for the diamon in the example
#
#
# ### Abstraction
# (Solve in 1-2 sentences, solve small problems)
#
# Create an array of integers that represents the number of '*' for each level.
# Then use this array to build the diamond, converting the integer for each array element into '*' and then output them to the screen, centered using the widest part of the diamond as the total number of characters for each level.
#
#
# ### Algorithm / Psuedo Code
# (Create algorithm using language of chosen data structure)

# Create the first half of the array by stepping in increments of 2, from 1 to n, storing each element in an array.
#
# Then mirror the array so that it steps down in hte same way it steps up.
#
# Lastly, convert the integers to '*' and then output each line to the screen with the '*'s centered.
require 'pry'

def create_diamond_array(n)
  diamond_array = (1..n).step(2).to_a
  diamond_array + diamond_array[0..-2].reverse
end

def convert_to_stars(arr)
  arr.map { |el| '*' * el }
end

def output_diamond(arr, n)
  arr.each do |line|
    puts line.center(n)
  end
end

def diamond(n)
  diamond_array = create_diamond_array(n)
  diamond_array = convert_to_stars(diamond_array)
  output_diamond(diamond_array, n)
end


diamond(9)

def convert_to_stars_hollow(arr)
  arr.map do |line|
    if line == 1
      "*"
    else
      "*" + (" " * (line - 2)) + "*"
    end
  end
end

def hollow_diamond(n)
  diamond_array = create_diamond_array(n)
  diamond_array = convert_to_stars_hollow(diamond_array)
  output_diamond(diamond_array, n)
end

hollow_diamond(9)
