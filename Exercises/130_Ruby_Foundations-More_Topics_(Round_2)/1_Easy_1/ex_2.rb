# ex_2.rb
# Optional Blocks

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

def compute(arg)
  if block_given?
    yield(arg)
  else
    'Does not compute.'
  end
end

puts compute(7) { |n| n + 3 } == 10
puts compute('c') { |x| 'a' + 'b' + x } == 'abc'
puts compute("What ever...") == 'Does not compute.'
