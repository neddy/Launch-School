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

#answer
# The `@@cats_count` class variable counts the number of instances of  the `Cat` class that are instantiated. We could test this as follows:


cat1 = Cat.new("Small")
cat2 = Cat.new("Big")
p Cat.cats_count == 2
