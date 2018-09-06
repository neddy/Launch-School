# ex_8.rb
# Fibonacci Numbers (Recursion)
# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

def fibonacci(n, round=3, last_two=[1,1])
  return 1 if n <= 2
  fib = last_two.reduce(:+)
  return fib if round == n
  last_two = [last_two[1], fib]
  round += 1
  fibonacci(n, round, last_two)
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
p fibonacci(500)

# Recommended Solution
def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end
p fibonacci(40)
