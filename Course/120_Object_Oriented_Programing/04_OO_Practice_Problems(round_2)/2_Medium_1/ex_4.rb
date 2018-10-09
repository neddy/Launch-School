# ex_4.rb
# Let's practice creating an object hierarchy.

# Create a class called Greeting with a single method called greet that takes a string argument and prints that argument to the terminal.
#
# Now create two other classes that are derived from Greeting: one called Hello and one called Goodbye. The Hello class should have a hi method that takes no arguments and prints "Hello". The Goodbye class should have a bye method to say "Goodbye". Make use of the Greeting class greet method when implementing the Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greet
  def greet(string)
    puts string
  end
end

class Hello < Greet
  def hi
    greet("Hello")
  end
end

class Goodbye < Greet
  def bye
    greet(self.class)
  end
end

Greet.new.greet("Test")

Hello.new.hi

Goodbye.new.bye
