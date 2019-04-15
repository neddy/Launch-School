# Building a select method


def select(array)
  counter = 0
  selected_elements = []
  while counter < array.size do
    element = array[counter]
    selected_elements << element if yield(element)
    counter += 1
  end

  selected_elements
end

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }       # => [1, 3, 5]
p array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
p array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def my_select(array)
  counter = 0
  selected_elements = []
  while counter < array.size do
    element = array[counter]
    selected_elements << element if yield(element)
    counter += 1
  end

  selected_elements
end

array = [1, 2, 3, 4, 5]

p my_select(array) { |num| num.odd? }       # => [1, 3, 5]
p my_select(array) { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
p my_select(array) { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
