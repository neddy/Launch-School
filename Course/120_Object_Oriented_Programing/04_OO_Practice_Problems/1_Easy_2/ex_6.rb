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

#answer

# `self.manufacturer` is a class method, we know this because the method definition is prefixed with `self`. We could call it by calling the class method in the class, as follows `Television.manufacturer`
