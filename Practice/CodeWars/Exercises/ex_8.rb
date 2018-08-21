# ex_8.rb
# Once upon a time, on a way through the old wild west,…
# … a man was given directions to go from one point to another. The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too. Going to one direction and coming back the opposite direction is a needless effort. Since this is the wild west, with dreadfull weather and not much water, it's important to save yourself some energy, otherwise you might die of thirst!
#
# How I crossed the desert the smart way.
# The directions given to the man are, for example, the following:
#
# ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
# or
#
# { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" };
# or (haskell)
#
# [North, South, South, East, West, North, West]
# You can immediatly see that going "NORTH" and then "SOUTH" is not reasonable, better stay to the same place! So the task is to give to the man a simplified version of the plan. A better plan in this case is simply:
#
# ["WEST"]
# or
#
# { "WEST" }
# or (haskell)
#
# [West]
# or (rust)
#
# [WEST];
# Other examples:
# In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH" is going north and coming back right away. What a waste of time! Better to do nothing.
#
# The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [] (nil in Clojure).
#
# In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].
#
# Task
# Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side).
#
# The Haskell version takes a list of directions with data Direction = North | East | West | South. The Clojure version returns nil when the path is reduced to nothing. The Rust version takes a slice of enum Direction {NORTH, SOUTH, EAST, WEST}.

# Understand the problem
# take a set of directions and remove the redundant movements.
# Redundant movements are those that are opposite to each other, with one following the other
#
# Data
# I: array
# O: array
#
# Solution
# start at the first direction, check if the next one is it's opposite? If it is, remove both diretions and then check again. Move to next index when no more directions can be removed. return array when you get to the last element of the array.

# Algorithm
# SET index = 0
# SET directions_remove = false
# loop
#   if element at index == opposite of elment at index + 1
#     remove elements
#     SET directions_remove == true
#   end
#   SET index += 1 unless directions_remove == true
#   SET directions_remove = false
#   break loop if index == directions size - 1
# end loop
# return directions
require 'pry'

OPPOSITES = { "NORTH" => "SOUTH", "SOUTH" => "NORTH", "EAST" => "WEST", "WEST" => "EAST" }
def dirReduc(arr)
  index = 0
  directions_remove = false
  loop do
    if arr[index] == OPPOSITES[arr[index + 1]]
      arr.slice!(index, 2)
      directions_remove = true
      index = 0
    end
    index += 1 unless directions_remove
    directions_remove = false
    break if index >= arr.size - 1
  end
  arr
end

# a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
# p dirReduc(a)
# p dirReduc(a) == ["WEST"]
# a = ["NORTH", "WEST", "SOUTH", "EAST"]
# p dirReduc(a) == ["NORTH", "WEST", "SOUTH", "EAST"]
# a =  ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"]
# p dirReduc(a) == ["WEST", "WEST"]
a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH"]
p dirReduc(a)
