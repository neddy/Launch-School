# ex_8.rb
#

def merge_sort(arr)
  if arr.size <= 1
    return arr
  end
  mid = arr.size/2
  left = arr[0...mid]
  right = arr[mid...arr.size]

  left = merge_sort(left)
  right = merge_sort(right)
  return merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty? do
    if left[0] < right[0]
      result << left.shift
    else
      result << right.shift
    end
  end
  result.concat(left) unless left.empty?
  result.concat(right) unless right.empty?
  result
end


p merge_sort([9, 5, 7, 1])
p merge_sort([9, 5, 7, 1, 3, 9, 10, 53, 1])
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
[1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
