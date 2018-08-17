=begin
- You can do similar thing with two elements, three elements, four elements etc.
- This solution is with three elements as that is the requirement :

- first iteration is over index of first number
- second iteration is over index of second number
- third iteration is over index of third number

Essentially, we are locking first and second number and iterating over third one
When this finishes we are moving second number by 1 place, first is still the same and iterating again over third element
We are repeating this step until we go to the last index of second element
Then we move first one by one place and repeat the step

Conditions that need to be met :
   - index of third element needs to be higher always than index of second and first one
   - index of second element needs to be higher than index of first one


Example with 5 numbers in array

[1,2,3,4,5]

we start iteration and index of first num is 0  --> arr[0] gives us number 1   ---> index of first element can only go as high as -3 since number 3 is the last number for first element that is possible
we start another iteration for index of second_number and the first index is 1 (first element is 2), the last possible index is -2
finally we start third and final iteration for index of third element which starts from index 2 (arr[2] is 2) and the last possible index is -1 which is the element 5

our first subarray is [arr[0], arr[1], arr[2]]
first and second index are locked and we move third one [arr[0], arr[1], arr[3]]
first two still locked and we move third again [arr[0], arr[1], arr[4]] now third element is 5 and we have come to the end
next step is to move index of element two by one [arr[0], arr[2], arr[2]] since the indexes of second and third elements are the same we skip this subarray
moving to next one [arr[0], arr[2], arr[3]] and next one after that [arr[0], arr[2], arr[4]]
again we are at the end so we move second index by 1 ocne again [arr[0], arr[3], arr[2]] now index of third element is less than index of second one so we skip this step, and we skip next one when they are the same
so we finally get to [arr[0], arr[3], arr[4]] which is the end for second element so we now change index of first element
[arr[1], arr[1], arr[2]] index of second element is the same as index of first one which is no-go so we skip this one
[arr[1], arr[1], arr[3]] again the same problem and [arr[1], arr[1], arr[3]] have the same problem as well as [arr[1], arr[1], arr[4]]

Now we move second element [arr[1], arr[2], arr[2]] but index of third element and index of second one are now the same so again we move third element
[arr[1], arr[2], arr[3]] , no problem here and we add this subbaray... same for [arr[1], arr[2], arr[4]] third element is at the end so we move second one
[arr[1], arr[3], arr[2]]   third one less then second no go and same is for [arr[1], arr[3], arr[3]] since now they are the same so the only added is [arr[1], arr[3], arr[4]]

Finally in last iteration we start with [arr[2], arr[1], arr[2]] --- do you understand why?
Many combinations will now be no-go until we get to [arr[2], arr[3], arr[4]] which is final combination
=end

def mult_of_three_nums(arr)
  subarr = []
  max = arr.max
  0.upto(arr.length - 3) do |first_num|
    1.upto(arr.length - 2) do |second_num|
      2.upto(arr.length - 1) do |third_num|
        return true if ((arr[first_num] * arr[second_num] * arr[third_num] == max) && (third_num > second_num) && (second_num > first_num))
      end
    end
  end
  return false
end

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false
