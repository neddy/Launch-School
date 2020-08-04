# ex_3.rb

# Tip calculator
# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.
#
# Example:
#
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0

def calculate_tip
  puts "What is the bill?"
  bill = gets.to_f
  puts "What is the tip percentage?"
  percent = gets.to_f / 100

  tip = (bill * percent)
  total = bill + tip

  puts "The tip is $#{format("%.2f" % tip)}"
  puts "The total is $#{format("%.2f" % total)}"
end


calculate_tip
