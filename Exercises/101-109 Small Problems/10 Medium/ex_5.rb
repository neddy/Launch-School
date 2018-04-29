# ex_5.rb
# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
#
# Examples
def odds_array(n)
  arr = []
  (1..n).each do |i|
    arr << i if i.odd?
  end
  arr + arr[0..-2].reverse
end

def diamond(n)
  arr = odds_array(n)
  arr.map! do |line|
    '*' * line
  end
  arr.each do |line|
    puts "#{line.center(n)}"
  end
end

diamond(1)

diamond(3)

diamond(9)

# Further Exploration
def diamond_outline(n)
  arr = odds_array(n)
  arr.map! do |line|
    if line == 1
      '*'
    else
      "*" + (" " * (line - 2)) + "*"
    end
  end
  arr.each do |line|
    puts "#{line.center(n)}"
  end
end

diamond_outline(1)

diamond_outline(3)

diamond_outline(9)
