# ex_9.rb
# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.each do |sub_arr| #This returned the same array, I should have used map and not mutated the origianl array
  sub_arr.sort!
  sub_arr.reverse!
end

p arr

# Suggested solution

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

p arr
