# my_car.rb

class MyCar
  attr_accessor :color, :speed, :model
  attr_reader :year

  def initialize(year, color, model, speed = 0)
    @year = year
    @color = color
    @model = model
    @speed = speed
  end

  def speed_up(speed)
    self.speed = self.speed + speed
  end

  def brake(speed)
    self.speed = self.speed - speed
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "You just painted your car #{self.color}"
  end
end

ned_car = MyCar.new(2014, 'red', 'Mazda')

puts ned_car.year
puts ned_car.color
puts ned_car.model
puts ned_car.speed

ned_car.speed_up(20)
puts ned_car.speed
ned_car.speed_up(20)
puts ned_car.speed
ned_car.brake(20)
puts ned_car.speed
ned_car.shut_off
puts ned_car.speed

ned_car.spray_paint('black')
