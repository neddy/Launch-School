arr = [1, 2, 3, 4, 5]
arr.each_index do |i|
  arr[i] = arr[i] += 1
end

puts arr.inspect
