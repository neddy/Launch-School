# ex_1.rb
# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
oracle.predict_the_future

# This code will return a string,
# The string will begin with: "You will " 
# and will have a random string from the array in the `choices` instance method contatenated onto it.
