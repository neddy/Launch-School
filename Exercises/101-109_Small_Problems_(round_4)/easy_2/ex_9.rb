# ex_9.rb

# String Assignment
# Take a look at the following code:
#
# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name
# What does this code print out? Think about it for a moment before continuing.
#
# If you said that code printed
#
# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:
#
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name
# What does this print out? Can you explain these results?

This time the output will be:

BOB
BOB

This is because `upcase!` will mutate the caller and as `name` and `save_name` both point to the same string, when `upcase!` is called on `name`, both are affected.
