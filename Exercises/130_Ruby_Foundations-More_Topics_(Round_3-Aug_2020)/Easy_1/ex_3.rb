# ex_3.rb

def missing(arr)
  all_numbers = (arr.first..arr.last).to_a
  all_numbers.select { |n| !arr.include?(n) }
end


puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
