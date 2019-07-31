class Clock
  include Comparable
  
  def initialize(hour, minutes = 0)
    @time = Time.new(1970, 1, 1, hour, minutes)
  end

  class << self
    alias_method :at, :new
  end

  def to_s
    format('%02d:%02d', time.hour, time.min)
  end

  def +(minutes)
    new_time = time + (minutes * 60)
    Clock.new(new_time.hour, new_time.min)
  end

  def -(minutes)
    self.+(-minutes)
  end

  def <=>(other)
    time <=> other.time
  end

  protected

  attr_reader :time
end
