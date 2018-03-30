require 'bigdecimal'

def prompt(message)
  puts"=> #{message}"
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  Float(num) rescue false
end

amount = ""
loop do
  prompt("Please enter the loan amount")
  amount = gets.chomp
  if valid_number?(amount) && amount.to_f > 0
    break
  else
    prompt("Please enter only numeric values greater than 0.")
  end
end

apr = ""
loop do
  prompt("Please enter the annual interest rate. E.g. for 5% enter: 5 or 5.00")
  apr = gets.chomp
  if valid_number?(apr) && apr.to_f >= 0
    break
  else
    prompt("Please enter only numeric values greater than or equal to 0.")
  end
end

prompt("Please enter the loan duration. \
First you will be prompted for the number of years, \
then for the number of months.")
years = ""
months = ""
loop do
  loop do
    prompt("Years:")
    years = gets.chomp
    if integer?(years)
      break
    else
      prompt("Please only enter the whole number of years.")
    end
  end
  loop do
    prompt("Months:")
    months = gets.chomp
    if integer?(months)
      break
    else
      prompt("Please only enter the whole number of months.")
    end
  end
  months = months.to_i + (years.to_i * 12)
  break if months > 0
  prompt("Please enter a positive duration of 1 month or greater.")
end

apr = BigDecimal.new(apr)

amount = BigDecimal.new(amount)
amount_left = amount

if apr != 0
  p = amount
  j = (apr / 100) / 12
  n = months
  payment = p * (j / (1 - (1 + j)**-n))

  months.times do
    amount_left = (amount_left + (amount_left * ((apr / 100) / 12))) - payment
  end
else
  payment = amount / months
  months.times { amount_left -= payment }
end

repayment_total = payment * months

puts("")
prompt(format("Loan amount: $%.2f", amount))
prompt(format("Interest rate: %.2f%%", apr))
prompt("Duration: #{months} months")
prompt(format("Monthly payment: $%.2f", payment))
prompt(format("Total value of repayments: $%.2f", repayment_total))
prompt(format("Amount left after #{months} payments: $%.2f", amount_left.abs))
