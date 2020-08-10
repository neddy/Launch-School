# ex_2.rb


def compute
  return "Does not compute." unless block_given?
  yield
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

def compute(x)
  return "Does not compute." unless block_given?
  yield(x)
end

puts compute(10) { |n| n + 5 + 3 } == 18
puts compute('c') { |x| 'a' + 'b' + 'c' } == 'abc'
puts compute("No block") == 'Does not compute.'
