# my_car.rb

class MyCar
  attr_accessor :color, :speed, :model
  attr_reader :year

  def initialize(year, color, model, speed = 0)
    @year = year
    self.color = color
    self.model = model
    self.speed = speed
  end

  def self.milaege(litres, kilometers)
    litres_per_100km = 100 / ( kilometers / litres.to_f )
    puts "#{litres_per_100km.round(2)} litres per 100km"
  end

  def speed_up(speed_input)
    self.speed = speed + speed_input
  end

  def brake(speed_input)
    self.speed = speed - speed_input
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(color_input)
    self.color = color_input
    puts "You just painted your car #{color}"
  end

  def to_s
    "Your car is a #{color}, #{year} #{model}. It is going #{speed} km/h."
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
puts ned_car

ned_car.spray_paint('black')
MyCar.milaege(45, 570)
