# ex_10.rb
# Fibonacci Numbers (Last Digit)
# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.
#
# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.
#
# Examples:

def fibonacci_last(n)
  last_two = [1, 1]
  n %= 60 # Further exploration
  (n - 2).times{ last_two = [last_two.last, last_two.sum  % 10] }
  last_two.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
