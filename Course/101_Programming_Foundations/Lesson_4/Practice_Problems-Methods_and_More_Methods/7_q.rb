# 7_q.rb
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The blocks return value is the return of num.odd?
# the returnof any? is boolean, if any of the blocks return true, then any? will return true
