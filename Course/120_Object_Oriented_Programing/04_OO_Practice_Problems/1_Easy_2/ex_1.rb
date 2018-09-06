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

#Answer
# A new instance of the class `Oracle` is create and stored in `oracle` on the first line. On the next line, a random string is return from the Array within the `choices` instance method definition. This happens because `choices` returns an array, and then the `Array#sample` method is called on that array.
