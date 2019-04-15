# My reduce

def reduce(array, accumulator = 0)
  counter = 0

  while counter < array.size do
    element = array[counter]
    accumulator = yield(accumulator, element)
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

def my_reduce(array, starting_value = nil)
  if starting_value
    accumulator = starting_value
    counter = 0
  else
    accumulator = array[0]
    counter = 1
  end

  while counter < array.size do
    element = array[counter]
    accumulator = yield(accumulator, element)
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p my_reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p my_reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p my_reduce([1, 2, 3], 15) { |acc, value| acc += value }     # => 'abc'
p my_reduce(['a', 'b', 'c'], "zzz") { |acc, value| acc += value }     # => 'abc'
