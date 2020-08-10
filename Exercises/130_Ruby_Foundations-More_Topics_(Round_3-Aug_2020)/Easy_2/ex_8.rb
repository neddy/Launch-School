# ex_8.rb
def max_by(arr)
  return nil if arr.empty?
  max_el = arr[0]
  max_yielded = yield(arr[0])

  arr[1..-1].each do |el|
    yielded_value = yield(el)
    if yielded_value > max_yielded
      max_yielded, max_el = yielded_value, el
    end
  end
  max_el
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
