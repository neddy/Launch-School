# return the count of pairs that have consecutive numbers as follows:

# For array [1,2,5,8,-4,-3,7,6,5]

# The pairs are selected as follows [(1,2),(5,8),(-4,-3),(7,6),5]
# --the first pair is (1,2) and the numbers in the pair are consecutive; Count = 1
# --the second pair is (5,8) and are not consecutive
# --the third pair is (-4,-3), consecutive. Count = 2
# --the fourth pair is (7,6), also consecutive. Count = 3.
# --the last digit has no pair, so we ignore.



# i: array
# O: integer (count of pairs)
# F:
# divide array into pairs
# iterate over pairs
# add one to count if second number is either one greater or less than first number
# ignore pair if it contains only one number
# return count

def pairs(arr)
  arr_pairs = []
  idx = 0
  loop do
    arr_pairs << arr.slice(idx..idx + 1)
    idx += 2
    break if idx >= arr.size
  end
  count = 0
  arr_pairs.each do |pair|
    next if pair.size < 2
    count += 1 if (pair[0] - pair[1]).abs == 1
  end
  count
end

p pairs([1,2,5,8,-4,-3,7,6,5])
p pairs([1,2,5,8,-4,-3,7,6,5]) == 3
