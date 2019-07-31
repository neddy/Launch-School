require 'date'

class Meetup
  def initialize(month, year)
    @meetup_month = Date.new(year, month)
  end

  def day(day, schedule)
    send(schedule, day)
  end

  def teenth(day)
    start_date = meetup_month + 12
    find_date_in_week(start_date, day)
  end

  def first(day)
    start_date = meetup_month
    find_date_in_week(start_date, day)
  end

  def second(day)
    start_date = meetup_month + 7
    find_date_in_week(start_date, day)
  end

  def third(day)
    start_date = meetup_month + 14
    find_date_in_week(start_date, day)
  end

  def fourth(day)
    start_date = meetup_month + 21
    find_date_in_week(start_date, day)
  end

  def last(day)
    start_date = meetup_month.next_month - 7
    find_date_in_week(start_date, day)
  end

  private

  attr_reader :meetup_month

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


puts Meetup.new(5, 2013).day(:monday, :teenth)
