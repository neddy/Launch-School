# ex_3.rb
# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
#
# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.
#
# You may not use ruby's Date and Time methods.
#
# Examples:

MINUTES_IN_HOUR = 60

def before_midnight(time_24hr)
  hours, minutes = time_24hr.split(":")
  hours = hours.to_i
  minutes = minutes.to_i
  hours = 0 if hours == 24
  total_minutes = hours * MINUTES_IN_HOUR
  total_minutes += minutes
  total_minutes = 1440 - total_minutes unless total_minutes == 0
  total_minutes
end

def after_midnight(time_24hr)
  hours, minutes = time_24hr.split(":")
  hours = hours.to_i
  minutes = minutes.to_i
  hours = 0 if hours == 24
  total_minutes = hours * MINUTES_IN_HOUR
  total_minutes += minutes
  total_minutes
end

# puts after_midnight('01:33')
# puts before_midnight('01:33')


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# Better solution

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
