# 4_q.rb

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
puts numbers.inspect # Expected: [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
puts numbers.inspect # Expected: [2, 3, 4, 5]
