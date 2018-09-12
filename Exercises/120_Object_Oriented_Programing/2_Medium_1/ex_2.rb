# ex_2.rb
# Fixed Array
# A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:
#
# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5
#
# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
#
# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
#
# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
#
# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
#
# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'
#
# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end
#
# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end
# The above code should output true 15 times.


# Understand the problem
# Create a class that represents an array with a fixed length. If an out of bounds index is accessed, return an index error.
#
# Data
# Store data in a hash internally


class FixedArray
  def initialize(n)
    @elements = Hash.new(:error)
    n.times do |idx|
      @elements[idx] = nil
    end
  end

  def [](idx)
    idx = negaitve_index_conversion(idx) if idx < 0
    validate_index(idx)
    @elements[idx]
  end

  def []=(idx, value)
    idx = negaitve_index_conversion(idx) if idx < 0
    validate_index(idx)
    @elements[idx] = value
  end

  def to_a
    @elements.values.clone
  end

  def to_s
    to_a.to_s
  end

  private

  def negaitve_index_conversion(idx)
    @elements.size + idx
  end

  def validate_index(idx)
    raise IndexError if @elements[idx] == :error
  end
end

# fixed_array = FixedArray.new(5)
# p fixed_array[4]
# fixed_array[4] = "test"
# p fixed_array[4]
# fixed_array[5] = "test"

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
#
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end
