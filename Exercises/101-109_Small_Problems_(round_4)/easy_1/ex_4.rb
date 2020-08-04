# ex_4.rb
#
# How Many?
# Write a method that counts the number of occurrences of each element in a given array.
#
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
#
# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.
#
# Expected output:
#
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# def count_occurrences(words)
#   occurrence_list = {}
#
#   words.each do |word|
#     occurrence_list[word] ||= 0
#     occurrence_list[word] += 1
#   end
#   occurrence_list
# end

def count_occurrences(words)
  occurrence_list = Hash.new(0)

  words.each do |word|
    occurrence_list[word] += 1
  end
  occurrence_list
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)
