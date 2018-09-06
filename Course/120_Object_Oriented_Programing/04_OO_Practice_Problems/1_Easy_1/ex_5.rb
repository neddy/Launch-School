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

# Answer
The `Pizza` class has an instance variable `@name`. We know this because instance variables are initilised beginning with a `@`.
