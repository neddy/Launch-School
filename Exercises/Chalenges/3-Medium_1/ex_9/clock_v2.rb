require 'pry'

class Clock
  include Comparable

  attr_reader :hour, :minute

  def initialize(hour, minutes = 0)
    @hour = hour
    @minute = minutes
  end

  class << self
    alias_method :at, :new
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(minutes)
    extra_hours, new_minute = (minute + minutes).divmod(60)
    new_hour = (hour + extra_hours) % 24
    Clock.new(new_hour, new_minute)
  end

  def -(minutes)
    self.+(-minutes)
  end

  def <=>(other)
    if hour == other.hour
      minute <=> other.minute
    else
      hour <=> other.hour
    end
  end
end

# test_clock = Clock.at(5, 30)
# puts test_clock + 160

# test_clock = Clock.new(0)

# test_clock_two = Clock.new(1)
#
# puts test_clock == test_clock_two
