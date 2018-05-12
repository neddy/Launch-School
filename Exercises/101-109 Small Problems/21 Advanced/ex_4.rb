# ex_4.rb
# Transpose MxN

def transpose(array)
  rows = array.size
  columns = array[0].size
  (0...columns).map do |colum|
    (0...rows).map do |row|
      array[row][colum]
    end
  end
end

p transpose([[1, 2, 3], [4, 5, 6]])

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
