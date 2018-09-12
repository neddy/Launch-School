# ex_1.rb
# Privacy
# Consider the following class:
#
# class Machine
#   attr_writer :switch
#
#   def start
#     self.flip_switch(:on)
#   end
#
#   def stop
#     self.flip_switch(:off)
#   end
#
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end
# Modify this class so both flip_switch and the setter method switch= are private methods.


class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def switch=(value)
    @switch = value
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

tester = Machine.new
tester.start
tester.stop


# Example For Notes below:
class Machine
  def read_switch
    self.switch
  end

  def write_switch(state)
    self.switch = state
  end

  def public_switch_getter
    @switch
  end

  private

  attr_accessor :switch
end

tester = Machine.new
tester.write_switch(:on)
puts tester.public_switch_getter
# puts tester.read_switch #Won't work #=> ...private method `switch' called for...
