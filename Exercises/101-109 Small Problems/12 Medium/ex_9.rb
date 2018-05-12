# ex_9.rb

def bubble_sort!(array)
  search_size = array.size
  loop do
    exchanges = 0
    (0...search_size).each do |index|
      if (array[index] <=> array[index + 1]) == 1
        array[index], array[index + 1] = array[index + 1], array[index]
        exchanges += 1
      end
    end
    search_size -= 1
    break if exchanges == 0
  end
   nil
end

p array = [5, 3]
p bubble_sort!(array)
p array


p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
