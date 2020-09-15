require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, schedule)
    send(schedule, day)
  end

  def teenth(day)
    find_day(day, 13)
  end

  def first(day)
    find_day(day, 1)
  end

  def second(day)
    find_day(day, 8)
  end

  def third(day)
    find_day(day, 15)
  end

  def fourth(day)
    find_day(day, 22)
  end

  def last(day)
    find_day(day, -7)
  end

  def find_day(day, start_day_of_month)
    date = Date.new(@year, @month, start_day_of_month)
    loop do
      break if Date::DAYNAMES[date.wday] == day.to_s.capitalize
      date = date.next
    end
    date
  end
end

# puts Meetup.new(2, 2013).day(:tuesday, :last)
