# Debugging with PRY

## PRY
Install pry
```
gem install pry
```

```Ruby
require 'pry'

puts 'foo'
binding.pry
puts 'bar'
```

Then you can inspect variables.


## PRY-BYEBUG [github link](https://github.com/deivid-rodriguez/pry-byebug)

Install pry-byebug
```
gem install pry-byebug
```

In a ruby script

```Ruby
require 'pry'
require 'pry-byebug'

puts 'foo'
binding.pry
puts 'bar'
```

Then you can inspect variables and additionally step throug the code using `next`, `step` and `continue`. More info here: https://github.com/deivid-rodriguez/pry-byebug

Alternatives to pry-byebug: [pry-nav](https://github.com/nixme/pry-nav) or [pry-debuigger](https://github.com/nixme/pry-debugger)
