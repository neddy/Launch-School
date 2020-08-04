

def my_select(array)
  selected_elements = []
  array.each { |el| selected_elements << el if yield(el) }
  selected_elements
end

array = [1, 2, 3, 4, 5]

p my_select(array) { |num| num.odd? }      # => [1, 3, 5]
p my_select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p my_select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
