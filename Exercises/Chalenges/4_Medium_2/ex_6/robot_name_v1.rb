require 'pry'

class Robot
  attr_reader :name

  @@past_names = []

  def initialize
    self.name = generate_name
  end

  def reset
    initialize
  end

  private

  def name=(new_name)
    @name = new_name
    @@past_names << new_name
    nil
  end

  def generate_name
    new_name = ''
    loop do
      new_name = format("%s%s%03d" % [random_letter, random_letter, rand(0..999)])
      break unless @@past_names.include?(new_name)
    end
    new_name
  end

  def random_letter
    rand(65..90).chr
  end
end

# robot = Robot.new
# puts robot.name
# robot.reset
# puts robot.name
