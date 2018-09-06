# my_car.rb

module Driveable
  def drive_over(terrain)
    case terrain
    when "bitumen"
      puts "All vehicles can drive on #{terrain}."
    when "off-road"
      if drive_wheels < 4
        puts "Your car can't drive here, it's only a #{drive_wheels}WD."
      else
        puts "No problem, your car can make it. It's a #{drive_wheels}WD."
      end
    end
  end
end

class Vehicle
  include Driveable
  attr_accessor :color, :speed, :model, :drive_wheels
  attr_reader :year
  @@vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@vehicles += 1
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

  def self.vehicles_created
    puts "You have created #{@@vehicles} vehicles"
  end

  def age
    puts "This vehicle is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - year
  end
end

module Carryable
  def can_carry?(cargo_weight)
    cargo_weight <= @load_capacity_kg
  end
end

class MyCar < Vehicle
  DRIVE_WHEELS = 2

  def initialize(year, color, model)
    super
    @drive_wheels = DRIVE_WHEELS
  end
  def spray_paint(color_input)
    self.color = color_input
    puts "You just painted your car #{color}"
  end
  def to_s
    "Your car is a #{color}, #{year} #{model}. It is a #{drive_wheels}WD vehicle, and it's going #{speed} km/h."
  end
end

class MyTruck < Vehicle
  include Carryable
  DRIVE_WHEELS = 4
  attr_accessor :load_capacity_kg

  def initialize(year, color, model, load_capacity_kg)
    super(year, color, model)
    @drive_wheels = DRIVE_WHEELS
    @load_capacity_kg = load_capacity_kg
  end
  def to_s
    "Your truck is a #{color}, #{year} #{model}. It is a #{drive_wheels}WD vehicle, and it's going #{speed} km/h."
  end
end

ned_car = MyCar.new(2014, 'red', 'Mazda CX-5')

puts ned_car.year
puts ned_car.color
puts ned_car.model
puts ned_car.speed
puts ned_car

ned_truck = MyTruck.new(2017, 'white', 'Ford Ranger', 1000)
puts ned_truck

puts ned_car.drive_wheels

ned_car.drive_over("bitumen")
ned_car.drive_over("off-road")
ned_truck.drive_over("off-road")

Vehicle.vehicles_created

p ned_truck.can_carry?(1200)
p ned_truck.can_carry?(1000)

puts MyTruck.ancestors

ned_truck.age
# ned_truck.years_old # Will not work.
