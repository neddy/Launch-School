require 'pry'

class Clock
  include Comparable

  attr_reader :hour, :minute

  def initialize(hour, minutes = 0)
    @hour = hour
    @minute = minutes
  end

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  def to_s
    "#{format("%02d", hour)}:#{format("%02d", minute)}"
  end

  def +(minutes)
    @minute += minutes
    normalise
    self
  end

  def -(minutes)
    @minute -= minutes
    normalise
    self
  end

  def <=>(other)
    if hour == other.hour
      minute <=> other.minute
    else
      hour <=> other.hour
    end
  end

  private

  def normalise
    if minute < 0
      @hour -= (minute.abs / 60)
      @minute = if minute.abs % 60 == 0
                  0
                else
                  @hour -= 1
                  60 - (minute.abs % 60)
                end
    elsif minute >= 60
      @hour += minute / 60
      @minute = minute % 60
    end

    if hour < 0
      @hour = if hour.abs % 24 == 0
                0
              else
                24 - (hour.abs % 24)
              end
    elsif hour >= 24
      @hour %= 24
    end
  end
end

# test_clock = Clock.new(0)
# test_clock_two = Clock.new(1)
#
# puts test_clock == test_clock_two
