# ex_2.rb
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# WE could fix this by defining a class method called `hi`, we would then need to create an instance of `Hello` class and then call the instance method `greet` on the object, passing the string object to it.


class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end
