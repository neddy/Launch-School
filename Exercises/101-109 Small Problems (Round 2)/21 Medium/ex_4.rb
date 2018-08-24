# ex_4.rb
# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.
#
# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.
#
# Example with n = 5 lights:
#
# - round 1: every light is turned on
# - round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# - round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# - round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# - round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
#
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
#
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# Understand the problem
# Iterate over an array of n length
# each time the array is iterated over, toggle the switches at set intervals
# The first iteration each second light should be toggled
# The next iteration, the space between toggles switches should increase by 1, and so on, until n.
#
# The method should take an integer n, which will represent the number of lights, and the number of iterations.

# Data
# I: integer
# O: Array (0 is off, 1 is on)

# Algorithm
# Create an array of 1s, n long
# loop
#   create a variable called spacing, set value to 2
#   loop
#     iterate over elements in array, toggling between 0 and 1 at the spacing set in `spacing`
#     Break at end of array
#   end
#   increase spacing variable by 1
#   break if spacing > n
# end

# get which lights are on
# loop over array of lights, add light number to new array if on

def toggle(element)
  element == 1 ? 0 : 1
end

def lights_on(array)
  lights_array = []
  array.each_with_index do |elm, idx|
    if elm == 1
      lights_array << idx + 1
    end
  end
  lights_array
end

def lights(n)
  array = Array.new(n, 1)
  increment = 2
  loop do
    index = increment
    loop do
      array[index - 1] = toggle(array[index - 1])
      index += increment
      break if index > n
    end
    increment += 1
    break if increment > n
  end
  lights_on(array)
end

p lights(1000)
