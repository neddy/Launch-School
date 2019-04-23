class Factorial
  attr_reader :n, :n_factorial

  def initialize(n = 0)
    @n = n
    @n_factorial = find_factorial(n)
  end

  def n=(n)
    @n = n
    @n_factorial = find_factorial(n)
  end

  def find_factorial(n)
    if n == 0 || n == 1
      1
    else
      factorial = 1
      2.upto(n).reduce(factorial) { |factorial, n| factorial *= n }
    end
  end

  def next
    @n += 1
    @n_factorial *= n
    self
  end

  def to_s
    "n = #{n}, n! = #{n_factorial}"
  end
end

factorial = Factorial.new
puts factorial.n
puts factorial.n_factorial
factorial.n = 200
puts factorial.next


factorial_enumerator = Enumerator.new do |yielder|
  factorial = Factorial.new

  loop do
    yielder << factorial.n_factorial
    factorial.next
  end
end

7.times { puts factorial_enumerator.next }

puts "Manual 'next': #{factorial_enumerator.next}"

puts "Another 7 times below:"
7.times { puts factorial_enumerator.next }

puts "Rewind..."

factorial_enumerator.rewind

7.times { puts factorial_enumerator.next }

factorial_enumerator.rewind

puts "Internal iteration"
factorial_enumerator.each_with_index do |num, idx|
  puts num
  break if idx >= 6
end
