# ex_10.rb
# Grocery List
# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.
#
# Example:

def buy_fruit(arr)
  arr.map do |fruit, quantity|
    [fruit] * quantity
  end.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
