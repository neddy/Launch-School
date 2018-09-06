# ex_9.rb
#

def fibonacci(n)
  last_two = [1, 1]
  (n - 2).times{ last_two = [last_two.last, last_two.sum] }
  last_two.last
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001)
