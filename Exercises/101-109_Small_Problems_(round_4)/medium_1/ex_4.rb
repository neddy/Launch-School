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



### Understand the Problem
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

# we need to simulate a bank of switchs n switches long. we need to then simulate switching on a light at each increament, starting at 1, and increasing up to n.

# The program needs to output the place of the switches that are on at the end of the process. The index of the switches starts at 1.


### Examples / Test Cases
# (Input / Output, Edge Cases? Bad input?)

# where n = 5
#
# thousand_switches(5) == [1, 4]

# where n = 10
#
# thousand_switches(5) == [1, 4, 9]


### Data Structures
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)

# We will use an array to store the state of the switches, with a boolean value of true for each switch that is on, and false for each switch that is off.


### Abstraction
# (Solve in 1-2 sentences, solve small problems)

# We will loop over the array n times, we will start with all switches on, to simulate the first pass.
#
# Next we will start at a step of 2 and switch on those lights, then the next iteration we will increase the step by 1, until we reach a step of n.


### Algorithm / Psuedo Code
# (Create algorithm using language of chosen data structure)

# create an array of n elements long, with all values set to true.
#
# iterate from 2..n
#   current step is equal to current iteration
#   invert the boolean value of each element at each step
# end
require 'pry'


def toggle_nth_switch!(switch_bank, n, step)
  (step - 1...n).step(step).each do |idx|
    switch_bank[idx] = !switch_bank[idx]
  end
end

def get_lights_on(switch_bank)
  switches_on = []
  switch_bank.each_with_index { |switch, idx| switches_on << idx + 1 if switch }
  switches_on
end

def thousand_switches(n)
  switch_bank = Array.new(n, true)

  (2..n).each do |current_step|
    toggle_nth_switch!(switch_bank, n, current_step)
  end

  get_lights_on(switch_bank)
end


p thousand_switches(1000)
