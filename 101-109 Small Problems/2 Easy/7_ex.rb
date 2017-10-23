# 7_ex.rb

def prompt(message)
  puts "=> #{message}"
end

even = (1..99).select {|n| n.even?}
even.each {|n| prompt(n)}

puts (1..99).select{ |i| i.even? }
