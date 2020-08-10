# ex_5.rb

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1

gather(items) do | *rest, last |
  puts rest.join(", ")
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

gather(items) do | first, *rest |
  puts first
  puts rest.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do | first, second, third, fourth |
  puts "#{first}, #{second}, #{third} and #{fourth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
