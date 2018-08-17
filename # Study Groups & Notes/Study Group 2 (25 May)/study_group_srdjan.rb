# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there articletwo same numbers
#   then that number can be used 2 times.

# Description:
# First find the max number, then find if any three numbers can be multiplied together to equal the max number.
# Select one number with index
# Then rotate through other numbers, skipping first number
# Then rotate first number

# def mult_of_three_nums(arr)
#   max_num = arr.max

#   arr.each_with_index do |num, idx|
#     arr.each_with_index do |num2, idx2|
#       next if idx2 == idx
#       arr.each_with_index do |num3, idx3|
#         next if idx3 == idx2 || idx3 == idx
#         return true if (num * num2 * num3) == max_num
#       end
#     end
#   end
#   false
# end

# def mult_of_three_nums(arr)
#   subarr = []
#   max = arr.max
#   0.upto(arr.length - 3) do |first_num|
#     1.upto(arr.length - 2) do |second_num|
#       2.upto(arr.length - 1) do |third_num|
#         return true if ((arr[first_num] * arr[second_num] *   arr[third_num] == max) && (third_num > second_num) && (second_num > first_num))
#       end
#     end
#   end
#   return false
# end
=begin

1. We need to find the maximum => array.max
2. Then we need to see if three consecutive numbers can be multiplied together to obtain the maximum value => [1*2*3],[2*3*4],[3*4*5],[4*5*6],[5*6*1],[6*1*2]
3*8*0, 8*0*9, 0*9*4, 9*4*2, 4*2*7, 2*7*3, 7*3*8
3.How to take the three elements => array[0..2]
4.When finish == array.length - 2
finish = array[0]
5. When finish == array.length - 1
finish = [0..1]

if start ==(array.size) - 2
array= [[(array.size) - 1],[array.last],[0]].flatten
end
if start == (array.size) - 1
array= [[array.last],[0],[1]].flatten
end

=end

#   def mult_of_three_nums(array)
#     max_number = array.max
#     combinantions = array.permutation(3).to_a
#     !!combinantions.find {|ary| ary.reduce(:*) == max_number}
#   end


# def mult_of_three_nums(arr)
#   arr.combination(3).to_a.each do |subarr|
#     return true if subarr.reduce(:*) == arr.max
#   end
#   false
# end

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false




# Write function scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
## Only lower case letters will be used (a-z). No punctuation or digits will be included.

# scramble('rkqodlw','world') == true
# scramble('cedewaraaossoqqyt','codewars') == true
# scramble('katas','steak') == false
# scramble('scriptjava','javascript') == true
# scramble('scriptingjava','javascript') == true



=begin
Given a string, find the number character that is repeated most times and return it's numeric value. If multiple characters are repeated the same time, return first one.
If there are no numeric characters in a string return nil.
=end

=begin
i: string
out: char first most reapeat  or nil if not number
f: make into array
 write to hash
 find max. key for max
 if max is number return max coverted to number else nil
=end

def re_letter(string)
return nil if string.empty?

hash = Hash.new{0}
string.each_char do |char|
  hash[char] += 1
end

most = hash.key(hash.values.max)

if ('0'..'9').include?(most)
  return most.to_i
else
  return nil
end
end


p re_letter('There isn\' any number here!') == nil
p re_letter('%^&*()!') == nil
p re_letter('111222333') == 1
p re_letter('1234335521444') == 4
p re_letter('') == nil
p re_letter('011-555-333-23') == 3
p re_letter('1') == 1
p re_letter('444352893599119') == 9
p re_letter('555333111') == 5
