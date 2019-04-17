# ex_2.rb
#

def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'


def compute(input)
  block_given? ? yield(input) : "Does not compute."
end

p compute(5) { |x| x + 10 }
p compute("test") { |input| input + ' b' }
p compute("test") == 'Does not compute.'
