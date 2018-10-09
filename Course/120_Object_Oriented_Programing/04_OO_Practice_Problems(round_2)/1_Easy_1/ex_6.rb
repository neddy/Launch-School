# ex_6.rb
# What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end
