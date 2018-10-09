# ex_3.rb
# In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

This is done by calling `self` from within the instance method which will return the calling object, and then calling the `class` method on that object, which will return the class of the object. `to_s` is automatically called on the return value of `self.class` as it is called from inside a string and is interpolated.
