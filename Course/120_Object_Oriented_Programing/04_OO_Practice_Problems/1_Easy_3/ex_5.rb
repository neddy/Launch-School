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
tv.manufacturer
tv.model

Television.manufacturer
Television.model

#Answer
tv = Television.new # This would create a new `Television` object and store it in `tv`
tv.manufacturer # This would raise a `NoMethodError`
tv.model # This would execute the code in the instance method `model`

Television.manufacturer # This would execute the code in the class method `manufacturer`
Television.model # This would raise a `NoMethodError`
