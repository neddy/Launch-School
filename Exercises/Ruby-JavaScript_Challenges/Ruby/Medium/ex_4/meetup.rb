require 'date'
require 'pry'

class Meetup
  DAYS = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
  SEARCH_START_DAY = {
    "first" => 1,
    "second" => 8,
    "third" => 15,
    "fourth" => 22,
    "fifth" => 29,
    "last" => -7,
    "teenth" => 13
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, meetup_day)
    date = Date.new(@year, @month, SEARCH_START_DAY[meetup_day.downcase])
    until date.wday == DAYS.index(weekday.downcase) do
      date = date.next
      return nil unless date.month == @month
    end
    date
  end
end

# meetup = Meetup.new(2013, 3)
# puts meetup.day('Monday', 'first')
#
# meetup = Meetup.new(2015, 10)
# puts meetup.day('Wednesday', 'fifth')
