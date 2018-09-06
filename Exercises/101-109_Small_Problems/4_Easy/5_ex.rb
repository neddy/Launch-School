# 5_ex.rb

def multisum(num)
  sum = 0
  (1..num).each do |i|
    if i % 3 == 0
      sum += i
    elsif i % 5 == 0
      sum += i
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
