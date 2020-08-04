def my_reduce(array, acc = nil)

  arr_copy = array.dup
  acc = arr_copy.shift unless acc

  arr_copy.each { |el| acc = yield(acc, el) }
  acc
end



array = [1, 2, 3, 4, 5]

p my_reduce(array) { |acc, num| acc + num }                    # => 15
p my_reduce(array, 10) { |acc, num| acc + num }                # => 25
# p my_reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p my_reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p my_reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
