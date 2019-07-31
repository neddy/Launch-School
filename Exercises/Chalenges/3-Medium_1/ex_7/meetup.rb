require 'date'

class Meetup

    START_DAY = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      teenth: 13,
      last: -7
    }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, schedule)
    start_date = Date.new(year, month, START_DAY[schedule])
    find_date_in_week(start_date, day)
  end

  private

  attr_reader :month, :year

  def find_date_in_week(start_date, day)
    range_to_check = start_date.upto(start_date + 6)
    range_to_check.detect do |date|
      correct_day?(day, date)
    end
  end

  def correct_day?(day, date)
    date.send((day.to_s + "?"))
  end
end


# puts Meetup.new(5, 2013).day(:monday, :teenth)
