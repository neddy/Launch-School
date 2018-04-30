# ex_4.rb
# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.
#
# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.
#
# Example with n = 5 lights:
#
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
#
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

def toggle_lights(n)
  lights = [false] * n
  (1..n).each do |round|
    lights.each_with_index do |light, index|
      lights[index] = !lights[index] if (index + 1) % round == 0
    end
  end
  lights_on = []
  lights.each_with_index do |light, index|
    lights_on << (index + 1) if light
  end
  lights_on
end

p toggle_lights(5)
p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p toggle_lights(1000)


# Recommended Solution

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)
