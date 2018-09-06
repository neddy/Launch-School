# ex_6.rb
# What could we add to the class below to access the instance variable @volume?

class Cube
  #Added line below
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end

  #Or we could add the following instance method
  def volume
    @volume
  end
end
