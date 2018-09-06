# ex_1.rb
# Cute angles
# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
#




# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.
#
# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".
#
# You may use this constant to represent the degree symbol:

require "pry"
DEGREE = "\xC2\xB0"
MIN_PER_DEGREE = 60
SEC_PER_MINUTE = 60
SEC_PER_DEGREE = MIN_PER_DEGREE * SEC_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SEC_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SEC_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SEC_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(76.73)

# Examples:
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
