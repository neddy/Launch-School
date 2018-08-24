# ex_7.rb
#
require 'date'

def friday_13th(year)
  (1..12).count do |month|
    Date.new(year,month,13).friday?
  end
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2


def five_fridays(year)
  day = Date.new(year, 1, 1)
  months = Hash.new(0)
  loop do
    months[day.mon] += 1 if day.friday?
    day = day.next
    break if day.year != year
  end
  months.values.count { |m| m >= 5 }
end


p five_fridays(2001) == 4
p five_fridays(2002) == 4
p five_fridays(2003) == 4
p five_fridays(2004) == 5
p five_fridays(2005) == 4
p five_fridays(2018) == 4
p five_fridays(2019) == 4
p five_fridays(2016) == 5
