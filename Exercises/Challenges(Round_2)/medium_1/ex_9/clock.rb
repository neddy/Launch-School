class Clock
  def initialize(hours, minutes = 0)
    @total_minutes = (hours * 60 + minutes) % 1440
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def +(minutes)
    Clock.new(0, @total_minutes + minutes)
  end

  def -(minutes)
    Clock.new(0, @total_minutes - minutes)
  end

  def ==(other)
    total_minutes == other.total_minutes
  end

  def to_s
    sprintf("%02d:%02d", *@total_minutes.divmod(60))
  end

  protected

  attr_reader :total_minutes
end

# clock_1 =  Clock.at(23, 30) - 5
# puts clock_1
# clock_2 =  "09:01"
#
# puts clock_1 == clock_2
