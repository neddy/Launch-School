# ex_8.rb

# Sum or Product of Consecutive Integers
# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
#
# Examples:
#
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def sum_or_product
  puts "Please enter an integer greater than 0:"
  num = gets.chomp.to_i

  puts "Enter 's' to compute the sum, 'p' to compute the product."
  choice = gets.chomp.downcase

  if choice == "s"
    sum = (1..num).to_a.sum
    puts "The sum of the integers between 1 and #{num} is #{sum}."
  elsif choice == "p"
    product = (1..num).to_a.reduce { |total, n| total * n }
    puts "The product of the integers between 1 and #{num} is #{product}."
  else
    puts "Invalid choice!"
  end
end

sum_or_product
