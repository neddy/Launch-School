class Clock
  def initialize(hours, minutes = 0)
    @hours = 0
    @minutes = 0
    add_hours(hours)
    self.+ minutes
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def +(minutes)
    hours, minutes = (minutes + @minutes).divmod(60)
    add_hours(hours)
    @minutes = minutes
    self
  end

  def -(minutes)
    hours, minutes = (@minutes - minutes).divmod(60)
    sub_hours(hours.abs)
    @minutes = minutes
    self
  end

  def ==(other)
    to_s == other.to_s && other.instance_of?(self.class)
  end

  def to_s
    sprintf("%02d:%02d", @hours, @minutes)
  end

  private

  def add_hours(hours)
    @hours = (@hours + hours) % 24
    nil
  end

  def sub_hours(hours)
    @hours = (@hours - hours) % 24
    nil
  end
end

# clock_1 =  Clock.at(23, 30) - 90
# puts clock_1
# clock_2 =  "09:01"
#
# puts clock_1 == clock_2
