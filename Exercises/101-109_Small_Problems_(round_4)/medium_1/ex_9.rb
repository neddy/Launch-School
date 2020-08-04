# ex_9.rb

# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.
#
# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)
#
# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.
#
# Rewrite your recursive fibonacci method so that it computes its results without recursion.
#
# Examples:
#
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501


def fibonacci(n)
  last_two_fib = [1, 1]

  (n - 2).times do
    last_two_fib = [last_two_fib[1], last_two_fib.sum]
  end
  last_two_fib.last
end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(5)

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501
