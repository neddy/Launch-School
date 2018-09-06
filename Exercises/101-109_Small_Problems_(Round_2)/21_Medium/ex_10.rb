# ex_10.rb
# Fibonacci Numbers (Last Digit)
# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.
#
# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.
#
# Examples:

def fibonacci(n)
  return 1 if n <= 2
  count = 3
  last = 1
  second_last = 1
  fib = 0
  loop do
    fib = last + second_last
    break if count == n
    last, second_last = fib, last
    count += 1
  end
  fib
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
