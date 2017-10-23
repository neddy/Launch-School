# 10_ex.rb
=begin
__Problem to solve:__
  Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.



__ Understand the Problem __
(Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)




__ Examples / Test Cases __
(Input / Output, Edge Cases? Bad input?)
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000



__ Data Structures __
(What data structure fits the problem and the input data?)
(Rules / requirements for input data?)




__ Algorithm __
(Create algorithm using language of chosen data structure)




__ Abstraction __
(Solve in 1-2 sentences, solve small problems)



__ Code Below __
=end

def calculate_bonus(num, bool)
  bool ? (num / 2) : 0
end



puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
