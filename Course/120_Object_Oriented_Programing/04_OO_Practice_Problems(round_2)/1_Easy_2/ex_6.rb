# ex_6.rb
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# The first method is a class method, this can be seen by observing the `self` before the method name in the method definition.
# A class method can be called as follows:
Television.manufacturer
