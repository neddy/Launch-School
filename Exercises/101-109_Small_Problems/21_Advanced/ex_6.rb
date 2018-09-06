# ex_6.rb
# Fix The Bug

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

is expected to print:
#
# []
# [21]
# [9, 16]
# [25, 36, 49]

# The bug was on line 4, the 'elsif' statement was missing the condition. This resulted in the 'eslif' instead assesing the truithiness of the Array#map method on the next line, which will always return an array, wich is truthy. After assessing the 'elsif' statement to be truthy, it returns 'nil' as there is nothing after the 'map' method to return in the 'elsif' branch.
