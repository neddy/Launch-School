class Robot
  @@robots = []
  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = generate_name
    @@robots << @name
    self
  end

  private

  def generate_name
    candidate_name = ""
    loop do
      candidate_name = "#{(65 + rand(26)).chr}#{(65 + rand(26)).chr}#{rand(100..999)}"
      break unless @@robots.include?(candidate_name)
    end
    candidate_name
  end
end

# puts Robot.new.name
# puts Robot.new.name
# puts Robot.new.name
