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
#
# 1)

gather(items) do |*produce , last|
  puts produce.join(', ')
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


# 2)

gather(items) do | first, *middle, last|
  puts first
  puts  middle.join(', ')
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


# 3)

gather(items) do | first, *produce|
  puts first
  puts produce.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


# 4)

gather(items) do | first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}."
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
