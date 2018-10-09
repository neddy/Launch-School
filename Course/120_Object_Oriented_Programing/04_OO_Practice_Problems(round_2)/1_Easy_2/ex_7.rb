# ex_7.rb
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# The class variable `@@cats_count` counts the number of `Cat` objects instantiated.

Cat.new("big")
Cat.new("little")
puts Cat.cats_count == 2
