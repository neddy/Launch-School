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

#ANS
# In the first version, the instance variable is set directly by referencing it with `@template`, and is accessed using the accessor method.

# In the second version, `@template` instance variable is set using the setter method by invoking `self.template`, the template getter method is also used to access the `@template` instance varible, the prefix of `self` in this instance is not needed.
