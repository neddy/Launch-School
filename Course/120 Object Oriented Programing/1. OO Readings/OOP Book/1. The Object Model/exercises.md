Chapter 1
1. How do we create an object in Ruby? Give an example of a creation.
```ruby
# Create a class
class MyClass
end

# Create an object
my_object = MyClass.new
```

2. What is a module? What is it's prupose? How do we use them with our classes? Create a module for the class you created in exercise 1, and include it properly.

A module is used to give a class extra functionality, it can be included in a class, and used in many different classes. 


```ruby
module MyModule
  def my_method(something)
  end
end

class MyClass
  include MyModule
end
```

# LS Answer
A module allows us to group reusable code into one place. We use modules in our classes by using the include reserved word, followed by the module name. Modules are also used as a namespace.
