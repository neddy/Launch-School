# ex_5.rb
# Passing Parameters Part 3
# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

# 1)
gather(items) do | *first_three, last |
  puts first_three.join(", ")
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


# 2)
gather(items) do | first, *middle, last |
  puts first
  puts middle.join(", ")
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


# 3)
gather(items) do | first, *the_rest |
  puts first
  puts the_rest.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


# 4)
gather(items) do | first, second, third, forth |
  puts "#{first}, #{second}, #{third} and #{forth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
