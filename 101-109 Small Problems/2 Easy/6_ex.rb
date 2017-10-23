# 6_ex.rb

def prompt(message)
  puts "=> #{message}"
end

100.times {|n| prompt(n) if n.odd?}

odd = (1..100).select {|n| n.odd?}
odd.each {|n| prompt(n)}
