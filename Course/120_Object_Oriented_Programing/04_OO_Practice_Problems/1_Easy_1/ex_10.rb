# ex_10.rb
# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

#Answer
# To create a new instance of the `Bag` class, we need to call `.new` on the `Bag` class and pass to arguments to it, as per the `initialize` method definition.
Bag.new("red", "leather")
