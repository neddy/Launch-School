# ex_7.rb
# Bubble Sort with Blocks

# Starting Method
# def bubble_sort!(array)
#   iterations = array.size - 1
#   loop do
#     swapped = false
#     iterations.times do |idx|
#       if array[idx] > array[idx + 1]
#         array[idx], array[idx + 1] = array[idx + 1], array[idx]
#         swapped = true
#       end
#     end
#     break unless swapped
#     iterations -= 1
#   end
#   array
# end

require 'pry'

def bubble_sort!(array)
  iterations = array.size - 1
  loop do
    swapped = false
    iterations.times do |idx|
      if block_given?
        next if yield(array[idx], array[idx + 1])
      else
        next if array[idx] <= array[idx + 1]
      end
      array[idx], array[idx + 1] = array[idx + 1], array[idx]
      swapped = true
    end
    break unless swapped
    iterations -= 1
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array
puts array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array
puts array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
puts array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
puts array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
puts array == %w(alice bonnie Kim Pete rachel sue Tyler)
