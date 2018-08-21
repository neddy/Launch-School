# ex_4.rb
# There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!

# The function has two input variables:
#
# customers: an array (list in python) of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
# n: a positive integer, the number of checkout tills.
# The function should return an integer, the total time required.
#
# EDIT: A lot of people have been confused in the comments. To try to prevent any more confusion:
#
# There is only ONE queue, and
# The order of the queue NEVER changes, and
# Assume that the front person in the queue (i.e. the first element in the array/list) proceeds to a till as soon as it becomes free.
# The diagram on the wiki page I linked to at the bottom of the description may be useful.
# So, for example:

# queue_time([5,3,4], 1)
# # should return 12
# # because when n=1, the total time is just the sum of the times
#
# queue_time([10,2,3,3], 2)
# # should return 10
# # because here n=2 and the 2nd, 3rd, and 4th people in the
# # queue finish before the 1st person has finished.
#
# queue_time([2,3,10], 2)
# # should return 12

# Understand the problem
# Take an input of one array, and one integer
# The array represents the customers, with each number in the array representing the time that customer need to checkout
# The integer represents the number of checkouts in operation
#
# Data
# I: array and integer
# O: integer (time for all customers to checkout)
#
#
# Solution
# Iterate over customers, adding all customers for a checkouts array, with sub arrays for each checkout, then sum the arrays and take the highest value as the time to checkout. The customers much be split by alternating between checkouts.
#
# Algorithm
# create checkouts array with an empty array for each checkout
# loop over all customers
#   add customer to checkout with least customers
# end
# sum checkoouts, and return largest sum

# My first solution
def queue_time(customers, n)
  checkouts = Array.new(n){ |_| [] }
  while !customers.empty? do
    checkout_idx = checkouts.find_index do |checkout|
      checkout.sum == checkouts.min_by{ |checkout| checkout.sum }.sum
    end
    checkouts[checkout_idx] << customers.shift unless customers.empty?
  end
  checkouts.map { |e| e.sum }.max
end

p queue_time([5,3,4], 1)
# should return 12
# because when n=1, the total time is just the sum of the times

p queue_time([10,2,3,3], 2)
# should return 10
# because here n=2 and the 2nd, 3rd, and 4th people in the
# queue finish before the 1st person has finished.

p queue_time([2,3,10], 2)
# should return 12


# Second Solution
def queue_time(customers, n)
  checkouts = Array.new(n, 0)
  while !customers.empty? do
    checkout_idx = checkouts.index(checkouts.min)
    checkouts[checkout_idx] += customers.shift unless customers.empty?
  end
  checkouts.max
end

p queue_time([5,3,4], 1)
# should return 12
# because when n=1, the total time is just the sum of the times

p queue_time([10,2,3,3], 2)
# should return 10
# because here n=2 and the 2nd, 3rd, and 4th people in the
# queue finish before the 1st person has finished.

p queue_time([2,3,10], 2)
# should return 12
