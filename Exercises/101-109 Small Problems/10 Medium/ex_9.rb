# ex_9.rb
# Fibonacci Numbers (Procedural)

def fibonacci(n)
  fib1, fib2 = [1,1]
  3.upto(n) do
    fib1, fib2 = [fib2, fib1 + fib2]
  end
  fib2
end
p fibonacci(1)
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
