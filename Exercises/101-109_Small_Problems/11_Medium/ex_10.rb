# ex_10.rb
# Fibonacci Numbers (Last Digit)
# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci(n)
  fib1, fib2 = [1,1]
  3.upto(n) do
    fib1, fib2 = [fib2, fib1 + fib2]
  end
  fib2
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)


# Further Exploration

def fibonacci_last(nth)
  last_2 = [1, 1]
  nth %= 60
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
