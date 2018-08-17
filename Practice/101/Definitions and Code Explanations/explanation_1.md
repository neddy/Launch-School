```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```
On line 2 a method `fix` is defined with the keywords def...end, it has one parameter `value`. On line 8 the variable `s` is assigned a string object `hello`. On line 9 the fix method is called with `s` as an argument, the return value of the block is assigned to the variable `t`. On line 3, the object references by the variable `value` is mutated with the `upcase!` method, and again on line 4 with the `concat` method. Finally the `value` variable is returned by the fix method. After this code has been executed, both the `s` and `t` variables will reference the string object 'HELLO!'. This code shows how a method can mutate an argument passed to it.

on line 8 the variable `s` is assigned the string object 'hello', on line 9 the method `fix` is called with `s` passed to it as an argument, the return value of the method call is assigned to the variable `t`. On line 2 the method `fix` is defined with the keywords `def...end`, on line 3 the method `upcase!` is called on the variable `value` which references the string object 'hello', mutating it to be 'HELLO', next on line 4 the method `concat` with a string object of '!' as an argument, is called on the variable `value` which references the string object 'HELLO', and mutates it to 'HELLO!', finally the variable `value` is returned by the method and assigned to the variable `t` on line 9. At the end of this code, both the `s` and `t` variable reference the same string object 'HELLO!', this shows that methods can mutate arguments passed to them in Ruby.


The variable `greeting` is assigned a reference to the string object 'Hello' on line 1, then on line 4 a blokc is defined by the loop method invocation along with the `do..end`, the variable greeting is reassigned a reference to a new string object 'Hi'. Finally the puts method is called on line 8 with greeting as an argument, which outputs 'Hi'. This example shows local variable scoping rules, specifically how variables initialised outside a block can be accessed and modified within a block.
