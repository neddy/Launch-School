# 9_ex.rb
=begin
__Problem to solve:__
  Write a method that takes one argument, a positive integer, and returns the sum of its digits.



__ Understand the Problem __
(Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

Take interger and sum it's digits


__ Examples / Test Cases __
(Input / Output, Edge Cases? Bad input?)

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45


__ Data Structures __
(What data structure fits the problem and the input data?)
(Rules / requirements for input data?)

Take input as integer
Split to array of strings for each digit

__ Algorithm __
(Create algorithm using language of chosen data structure)

convert integer to string
split string to array
convert elements of array back to integers
sum array and return value


__ Abstraction __
(Solve in 1-2 sentences, solve small problems)



__ Code Below __
=end

def sum(num)
  num.to_s.split('').map(&:to_i).sum
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
