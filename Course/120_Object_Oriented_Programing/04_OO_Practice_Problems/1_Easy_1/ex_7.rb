# ex_7.rb
# What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

#Answer
# Returns a string representing obj. The default to_s prints the object's class and an encoding of the object id. As a special case, the top-level object that is the initial execution context of Ruby programs returns “main''.

# This can be confirmed by reading the documentation of `Object` in the ruby documentation
#
# http://ruby-doc.org/core-2.5.1/Object.html#method-i-to_s
