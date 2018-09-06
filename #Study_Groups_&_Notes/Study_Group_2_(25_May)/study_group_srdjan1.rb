# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there articletwo same numbers
#   then that number can be used 2 times.

# Description:
# First find the max number, then find if any three numbers can be multiplied together to equal the max number.

# Select one number with index
# Then rotate through other numbers, skipping first number
# Then rotate first number

def mult_of_three_nums(arr)
  max_num = arr.max

  arr.each_with_index do |num, idx|
    arr.each_with_index do |num2, idx2|
      next if idx2 == idx
      arr.each_with_index do |num3, idx3|
        next if idx3 == idx2 || idx3 == idx
        return true if (num * num2 * num3) == max_num
      end
    end
  end
  false
end

p mult_of_three_nums([1,2,3,4,5,6])

p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false
