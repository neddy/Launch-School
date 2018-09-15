Hi,

Could someone please have a look at this for me? I'm doing one of the exercises and I think I came across a bug in the solution code, but I'm not sure, so before I submit feedback on the exercise page I thought I would get a second opinion first... 

In the code below, the class method `for_term` should return a new instance of `NoScore` if there is a `ZeroDivisionError`. However after some testing, playing around in irb, and some reading of the documentation for `Float`, it looks like there will never be a `ZeroDivisionError`. Both `positive` and `negative` are instances of `Float`, and when a `Float` is divided by 0 it will either return either `Float::INFINITY` or `Float::NAN`, with `Float::NAN` being returned if the dividend is also equal to 0, and `Float::INFINITY` being returned if the dividend is either greater than or less than 0.

In this case it is only possible to divide by `0.0` if both `positive` and `negative` are `0.0`, which will return the constant `Float::NAN`, which will never trigger the `rescue` clause and return a new instance of `NoScore`. Does this sound correct?

```ruby
class Score
  def self.for_term(term)
    positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
    negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

    positive / (positive + negative)
  rescue ZeroDivisionError
    NoScore.new
  end
end
```

If my reasoning above is correct, would something like this be better?

```ruby
class Score
  def self.for_term(term)
    positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
    negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

  if positive > 0 || negative > 0
    positive / (positive + negative)
  else
    NoScore.new
  end
end
```
