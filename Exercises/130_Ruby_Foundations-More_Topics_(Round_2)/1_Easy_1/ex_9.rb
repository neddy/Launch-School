# ex_9.rb
# Iterators: True for One?

# In the previous 3 exercises, you developed methods called any?, all?, and none? that are similar to the standard Enumerable methods of the same names. In this exercise, you will develop one last method from this family, one?.
#
# Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a value of true for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.
#
# Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.
#
# Your method should stop processing elements of the Array as soon as the block returns true a second time.
#
# If the Array is empty, one? should return false, regardless of how the block is defined.
#
# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.
#
# Examples:

# def one?(arr)
#   one_found = false
#   arr.each do |el|
#     if yield(el) && one_found == true
#       return false
#     elsif yield(el)
#       one_found = true
#     end
#   end
#   one_found
# end
#
# puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# puts one?([1, 3, 5, 7]) { |value| true }           # -> false
# puts one?([1, 3, 5, 7]) { |value| false }          # -> false
# puts one?([]) { |value| true }                     # -> false
require 'pry'

# This was supposed to be shoter, didn't work out that way...
# def one?(arr)
#   one_found = false
#   two_found = !!arr.detect do |el|
#     if !!yield(el) && one_found == true
#      two_found = true
#    elsif !!yield(el)
#      one_found = true
#      nil
#    end
#   end
#   two_found ? false : one_found
# end
#
# puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# puts one?([1, 3, 5, 7]) { |value| true }           # -> false
# puts one?([1, 3, 5, 7]) { |value| false }          # -> false
# puts one?([]) { |value| true }                     # -> false


# def one?(arr)
#   1 == arr.reduce(0) do |count, el|
#          count += 1 if yield(el)
#          return false if count > 1
#          count
#        end
# end
#
# def one?(arr)
#   count = arr.reduce(0) do |count, el|
#             count += 1 if yield(el)
#             return false if count > 1
#             count
#           end
#   count == 1
# end

# puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# puts one?([1, 3, 5, 7]) { |value| true }           # -> false
# puts one?([1, 3, 5, 7]) { |value| false }          # -> false
# puts one?([]) { |value| true }                     # -> false

def one?(arr)
  seen_one = false
  arr.each do |el|
    return false if seen_one && yield(el)
    seen_one = true if yield(el)
  end
  seen_one
end

puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false
