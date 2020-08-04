# ex_7.rb

# Even Numbers
# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
#
# (1..99).each { |x| puts x if x.even? }

(2..99).step(2) { |x| puts x }
