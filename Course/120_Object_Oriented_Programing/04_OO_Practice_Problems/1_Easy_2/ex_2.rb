# ex_2.rb
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:
trip = RoadTrip.new
trip.predict_the_future

# Answer
# A random string from the array in the `choices` instance method defined in the class `RoadTrip` will be returnd, it will be appended to the end of the string "You will ".
