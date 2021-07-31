class Clock
  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def initialize(hours, minutes = 0)
    @time_in_minutes = (hours * 60) + minutes
  end

  def to_s
    hours, minutes = @time_in_minutes.divmod(60)
    format("%02d:%02d", hours, minutes)
  end

  def +(minutes)
    _, @time_in_minutes = (@time_in_minutes + minutes).divmod(1440)
    self
  end

  def -(minutes)
    _, @time_in_minutes = (@time_in_minutes - minutes).divmod(1440)
    self
  end

  def ==(other)
    @time_in_minutes == other.time_in_minutes
  end

  protected

  attr_reader :time_in_minutes
end

# puts Clock.at(10) + 5
