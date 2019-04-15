# def reduce(array, accumulator = 0)
#   counter = 0
#
#   while counter < array.size do
#     accumulator = yield(accumulator, array[counter])
#     counter += 1
#   end
#
#   accumulator
# end
#
#
# array = [1, 2, 3, 4, 5]
#
# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


def reduce(array, accumulator = nil)

  if accumulator
    counter = 0
  else
    counter = 1
    accumulator = array[0]
  end

  while counter < array.size do
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
