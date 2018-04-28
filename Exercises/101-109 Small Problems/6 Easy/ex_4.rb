# ex_4.rb
# Reversed Arrays (Part 1)

# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.
#
# You may not use Array#reverse or Array#reverse!.
#
# Examples:

def reverse!(list)
  times_to_loop = (list.size / 2)
  times_to_loop.times do |num|
    list[0 + num], list[-1 + (-num)] = list[-1 + (-num)], list[0 + num]
  end
  list
end


p list = [1,2,3,4]
p result = reverse!(list)
p list = %w(a b c d e)
p reverse!(list)


p list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

p list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

p list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]

p list = []
p reverse!(list) # => []
p list == []
