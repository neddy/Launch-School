# ex_10.rb
# A friend of mine takes a sequence of numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (n is always strictly greater than 0) and returns an array or a string (depending on the language) of the form:
#
# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.
#
# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ...will be sorted in increasing order of the "a".
#
# It happens that there are several possible (a, b). The function returns an empty array (or an empty string) if no possible numbers are found which will prove that my friend has not told the truth! (Go: in this case return nil).
#
# (See examples of returns for each language in "RUN SAMPLE TESTS")
#
# Examples:
# removNb(26) should return [(15, 21), (21, 15)]

# Solution 1
def removNb(n)
  numbers = (1..n).to_a
  all_permutations = numbers.permutation(2).to_a
  possible_pairs = []
  all_permutations.each do |pair|
    other_numbers = numbers.reject{ |i| pair.include?(i) }
    possible_pairs << pair if other_numbers.reduce(:+) == pair.reduce(:*)
  end
  possible_pairs
end

# p removNb(26)
# p removNb(26) == [[15, 21], [21, 15]]
# p removNb(100) == []


# Solution 2 - A little quicker as it does not compute all permutations. The order may not be what is wanted as it does not add the elements in the order of their permutations, but rather just added the second matching pair by reversing the first one.
def removNb(n)
  numbers = (1..n).to_a
  all_combinations = numbers.combination(2).to_a
  possible_pairs = []
  sum = numbers.reduce(:+)
  all_combinations.each do |pair|
    if (sum - pair.reduce(:+)) == pair.reduce(:*)
      possible_pairs << pair
      possible_pairs << pair.reverse
    end
  end
  possible_pairs
end

p removNb(26)

# Note - Both solutions timed out...
