# ex_2.rb

def zip(arr1, arr2)
  zipped_array = []
  idx = 0
  length = arr1.length
  while idx < length do
    zipped_array << [arr1[idx], arr2[idx]]
    idx += 1
  end
  zipped_array
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
