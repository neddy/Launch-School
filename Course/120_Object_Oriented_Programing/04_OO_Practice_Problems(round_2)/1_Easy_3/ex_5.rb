# ex_5.rb
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # This would produce an error
tv.model # This would execute the code in the `model` instance method

Television.manufacturer # This would execute the code in the `manufacturer` class method
Television.model # This would produce an error.
