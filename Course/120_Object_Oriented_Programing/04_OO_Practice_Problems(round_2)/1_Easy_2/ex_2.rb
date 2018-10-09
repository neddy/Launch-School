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

# In this case the random string concatenated onto the end of the string "You will ", will come from the array withing the `choices` instance method in the `RoadTrip` class. This is because `RoadTrip#choices` overrides `Oracle#choices`.
