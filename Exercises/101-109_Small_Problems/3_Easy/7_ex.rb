# 7_ex.rb

def oddities(array)
  array.select.with_index { |element, index| index.even?}
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

def oddities2(array)
  new_array = []
  array.each_with_index { |element, index| new_array << element if index.even?}
  new_array
end

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []
