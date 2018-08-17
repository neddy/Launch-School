# Assesment 1 Prep Notes

### Specific Topics of Interest
Be able to explain clearly the following topics:

* local variable scope, especially how local variables interact with method invocations with blocks and method definitions
* how passing an object into a method definition can or cannot permanently change the object
* working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.
* [variables as pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
* [puts vs return](https://launchschool.com/books/ruby/read/methods#putsvsreturnthesequel)
* false vs nil and the idea of "truthiness"
* method definition and method invocation
* implicit return value of method invocations and blocks


### How to Answer Questions

* Be very specific
* Use line numbers
* Highlight syntactical conventions, i.e. ensure you explain major Ruby syntactical conventions, such as defining and invoking blocks.
* Explain principles shown in the example if present.

Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```

On line 1 the string "Hello" is assigned to the variable `greeting`. On lines 3 to 6 a block is defined by the `do...end` alongside the `loop` method invocation. On line 4 the string "Hi" is reassigned to the variable `greeting`. On line 8 the `puts` method is invoked with the variable `greeting` passed in as an argument, and as the variable `greeting` now points to the string "Hi", this is output to the screen. This code demonstrates that local variables defined outside a block can be accessed and modified within a block.

For example, let's take the following piece of code.

```ruby
def a_method
  puts "hello world"
end
```
Describe the method.

On line 1 the method `a_method` is defined between the `def...end`. On line 2 the `puts` method is invoked with the string "hello world" passed to it as an argument, which is output to the screen. The return value of the method is `nil`.

### Definitions

*Truthiness*
Everythis except `nil` and `false` in ruby evaluates to `true`, however a truthy value is not the same as the boolean `true`.

*Method Definition*
This is when in our code we use the `def` keyword to define a method.

*Method Invocation*
This is when a method is called with the code. This could be a custom method we defined as above, or any of the Ruby Core API or Core Library.

*Argument vs Parameter*
A Parameter is what is used to define what can be passed to a method as an argument when a method is defined. An Argument is something that is passed to a method when it is invoked.

*Block*
A block in Ruby is defined by curly braces or `do...end` and a method invocation. i.e.

*Methods and Blocks*
```ruby
[1, 2, 3].each { |num| puts num }
```
The block acts as an argument to the `each` method in this case.

Methods invoked with a block can execute the block within the method, and can also use the return value of the block.

```ruby
a = "hello"

[1, 2, 3].map { |num| a } # => ["hello", "hello", "hello"]
```
In this example, the `map` method uses the return value of the block to transform the array that `map` was called on.

A method cannot directly access or reassign local variables initialised outside the method from within the method. A block can access local variables and reassign them. Methods can access local variable through interactions with blocks

Summarised points on Methods and Blocks:
* The def..end construction in Ruby is method definition
* Referencing a method name, either of an existing method or subsequent to definition, is method invocation
* Method invocation followed by {..} or do..end defines a block; the block is part of the method invocation
* Method definition sets a scope for local variables in terms of parameters and interaction with blocks
* Method invocation uses the scope set by the method definition


[Futher Reading](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)


*Each*
Each iterates through each element of a collection, and returns the original collection upon completion, ignoring the return value of the block. The code block is executed for each iteration, with each element sent to the block as an argument.


*Select*
Map iterates through each element of a collection, and creates a new array based on the return value of the block. If the return value of the block evaluates to true then the element is selected. The new array will contain only the selected elements from the original collection.


*Map*
Map iterates through each element of a collection, and creates a new array based on the return value of the block. Each element is transformed based on the return value of the block. The new array will have the same number of elements as the collection that map was called on.

[More on each, map & select](https://launchschool.com/lessons/85376b6d/assignments/3034b4e0)
