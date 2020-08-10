# fib = Enumerator.new do |y|
#   a = b = 1
#   loop do
#     y << a
#     a, b = b, a + b
#   end
# end
#
# p fib.take(11) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]


factorial = Enumerator.new do |y|
  number = 0
  loop do
    if number == 0
      y << 1
    else
      y << (1..number).to_a.reduce(&:*)
    end
    number += 1
  end
end

p factorial.take(5) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
# p factorial.next
# p factorial.next
# p factorial.next
