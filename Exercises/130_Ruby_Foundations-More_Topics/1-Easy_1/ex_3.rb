# ex_3.rb
#


def missing(array)
  new_array = (array.min..array.max).to_a
  array.each { |num| new_array.delete(num) }
  new_array
end

p missing([-5, -3, -2, 1, 5])

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
