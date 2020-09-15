require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @schedule_start_day = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
  end

  def day(day, schedule)
    date = Date.new(@year, @month, @schedule_start_day[schedule])
    loop do
      break if Date::DAYNAMES[date.wday] == day.to_s.capitalize
      date = date.next
    end
    date
  end
end
