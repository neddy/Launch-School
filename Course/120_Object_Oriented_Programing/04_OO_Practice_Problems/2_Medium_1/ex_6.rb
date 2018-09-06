# ex_6.rb
# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# In the first, `@template` is set by directly assigning the string object to the instance variable, in the second, it is set by hte setter method. Both the first and second example use the getter method to access `template`. The `self` in the second example is not necessary.
