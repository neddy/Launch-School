# 4_ex.rb
# Problem to solve:

# Write a method that counts the number of occurrences of each element in a given array.
# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
# count_occurrences(vehicles)

# __ Understand the Problem __
# (Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)

# Count the number of occurences of an element in an array, then return a list of each element and how many times it occured
#
#
#
#
# __ Examples / Test Cases __
# (Input / Output, Edge Cases? Bad input?)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# __ Data Structures __
# (What data structure fits the problem and the input data?)
# (Rules / requirements for input data?)

# Input => Array
# Output => Hash
#
#
#
# __ Algorithm __
# (Create algorithm using language of chosen data structure)

# Get array
# Iterate over each element and count occurences
# Do not count duplicate occurences again
# Print elements along with count

# __ Abstraction __
# (Solve in 1-2 sentences, solve small problems)
# Take input array, then iterate over the array and count how many times each element exists. Print a list of elements and how many times each element occured
#
#
#
#
#
# __ Code Below __

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
  occurrences = {}
  arr.each do |element|
    if occurrences.include?(:element)
      next
    else
      occurrences[element] = arr.count(element)
    end
  end
  occurrences.each {|e,i| puts "#{e} => #{i}"}
end

count_occurrences(vehicles)
