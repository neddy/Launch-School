require 'pry'

class Robot
  attr_reader :name

  @@past_names = []

  def initialize
    generate_name
  end

  def reset
    initialize
  end

  private

  def generate_name
    new_name = ''
    loop do
      new_name = random_letters + random_number
      break unless @@past_names.include?(new_name)
    end
    @name = new_name
    @@past_names << name
    nil
  end

  def random_letters
    rand(65..90).chr + rand(65..90).chr
  end

  def random_number
    rand(0..999).to_s.rjust(3, '0')
  end
end

robot = Robot.new
puts robot.name
robot.reset
puts robot.name
