# Clock

Create a clock class

Should be able to set time by passing in either an hour with or without minutes

Should be able to add and subtract minutes

should be able to test equality

Should be able to output time as string

# Data Structure

hours as integer
minutes as integer

# Solution

initialize(hours, minutes = 0)
setup hours and minutes

to_s()
return hours and minutes formatted as follows 23:59

+(minutes)
add minutes to minutes
hours = minutes / 60
minutes = minutes % 60

-(minutes)
subtract from minutes
if minutes < 0
  hours = (hours - absolute_value_minutes / 60) - 1
  minutes = absolute_value_minutes % 60
