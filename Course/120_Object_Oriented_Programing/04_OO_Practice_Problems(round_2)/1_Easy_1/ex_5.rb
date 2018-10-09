# ex_5.rb
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Ans
# The second class has an instance variable, this can be seen by the use of an `@` at the start of the instance variable name.

# We can also see if they have instance variables by using the `instance_variables` instance method.

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables
