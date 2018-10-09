# ex_1.rb
# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

# They are all objects, we can find their class by calling `.class` on the objects

puts true.class
puts "hello".class
puts [1, 2, 3, "happy days"].class
puts 142.class

# > TrueClass
# > String
# > Array
# > Integer
