require 'pry'

class Clock
  include Comparable

  attr_reader :total_minutes

  def initialize(hour, minutes = 0)
    @total_minutes = ((hour * 60) + minutes) % 1440
  end

  class << self
    alias_method :at, :new
  end

  def to_s
    hour, minute = total_minutes.divmod(60)
    format('%02d:%02d', hour, minute)
  end

  def +(minutes)
    Clock.new(0, total_minutes + minutes)
  end

  def -(minutes)
    self.+(-minutes)
  end

  def <=>(other)
    total_minutes <=> other.total_minutes
  end
end

# test_clock = Clock.new(23)
# puts test_clock + 70

# test_clock = Clock.new(0)

# test_clock_two = Clock.new(1)
#
# puts test_clock == test_clock_two
