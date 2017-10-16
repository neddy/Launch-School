# mortgage_calculator.rb

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def two_decimal_places(input)
  # Check if float has 2 or less decimal places
  input.to_f.round(2).to_s == input || input.to_f.round(2).to_s == '0' + input
end

def loan_amount
  amount = ''
  prompt("Please enter the loan amount in whole dollars excluding the '$' and any decimals.")
  loop do
    amount = gets.chomp
    if integer?(amount)
      break if amount.to_i > 0
      prompt('Please enter an amount great than 0')
    else
      prompt("Please only enter whole numbers without any symbols, please try again...")
    end
  end
  amount.to_i
end

def interest_rate
  rate = ''
  prompt("Please enter the interest rate. You can enter an interst rate with up"\
    " to 2 decimal places. eg: 5.55 (Please exclude the '%' sign.)")
  loop do
    loop do
      rate = gets.chomp
      break if float?(rate) || integer?(rate)
      prompt("Please only enter valid numbers without any symbols. Please try again...")
    end
    if integer?(rate) || two_decimal_places(rate)
      break if rate.to_f > 0
      prompt('Please enter an interest rate greater than 0')
    else
      prompt('Please only enter numbers with up to 2 decimal places, please try again...')
    end
  end
  rate.to_f
end

def loan_duration
  duration_months = 0
  loop do
    prompt('Please enter the loan duration in years and / or months below:')
    loop do
      prompt('Please enter the number of years')
      years = gets.chomp
      if integer?(years)
        duration_months = years.to_i * 12
        break
      end
      break if years == ''
      prompt("Please only enter whole numbers, without any symbols or letters."\
        " Please try again...")
    end
    loop do
      prompt('Please enter the number of months')
      months = gets.chomp
      if integer?(months)
        duration_months += months.to_i
        break
      end
      break if months == ''
      prompt("Please only enter whole numbers, without any symbols or letters."\
        " Please try again...")
    end
    break if duration_months > 0
    prompt('You must enter a loan duration and it must be greater than 0')
  end
  duration_months
end

def details_from_user
  prompt('Welcome to the mortgage / loan calculator')
  amount, rate, duration_months = 0
  loop do
    amount = loan_amount()
    rate = interest_rate()
    duration_months = loan_duration()
    prompt("You have entered the following details:")
    prompt('----------------------------------------')
    prompt("Loan amount  :    $#{amount}")
    prompt("Interest rate:    #{rate}%")
    prompt("Loan duration:    #{duration_months / 12} years #{duration_months % 12} months")
    prompt('----------------------------------------')
    prompt('Are these details correct? (y/n)')
    continue = gets.chomp.downcase
    break if continue.start_with?('y')
    prompt('Please enter the details again:')
  end
  return amount, rate, duration_months
end

def payment_calculator(amount, rate, duration_months)
  monthly_rate = (rate / 12) / 100
  p = amount
  j = monthly_rate
  n = duration_months
  p * (j / (1 - (1 + j)**-n))
end

# Create loan schedule which will show monthly figures, broken up into interest, pricipal and amount outstanding.
# The loan schedule should always end with the outstanding amount being equal to 0, this was a good way for me to test outputs.
def loan_schedule(amount, rate, duration_months, monthly_payment)
  amount_owing = amount
  monthly_rate = (rate / 12) / 100
  loan_schedule = [[0, 0, amount_owing]]
  duration_months.times do
    interest = amount_owing * monthly_rate
    principal = monthly_payment - interest
    amount_owing -= monthly_payment - interest
    loan_schedule << [interest, principal, amount_owing]
  end
  prompt("Initial loan amount: $#{amount}")
  prompt('Month   |   Interest   |   Principal   |   Outstanding')
  prompt('------------------------------------------------------')
  loan_schedule.each_with_index do |loan, month|
    prompt("#{month}   |   $#{loan[0].round(2)}   |   $#{loan[1].round(2)}   |   $#{loan[2].round(2)}")
  end
end

# Main logic
prompt('Welcome to the mortgage / loan calculator')
amount, rate, duration_months = 0

# Get input from user
loop do
  amount = loan_amount()
  rate = interest_rate()
  duration_months = loan_duration()
  prompt("You have entered the following details:")
  prompt('----------------------------------------')
  prompt("Loan amount  :    $#{amount}")
  prompt("Interest rate:    #{rate}%")
  prompt("Loan duration:    #{duration_months / 12} years #{duration_months % 12} months")
  prompt('----------------------------------------')
  prompt('Are these details correct? (y/n)')
  continue = gets.chomp.downcase
  break if continue.start_with?('y')
  prompt('Please enter the details again:')
end

monthly_payment = payment_calculator(amount, rate, duration_months)
prompt("Your monthly payment will be: $#{monthly_payment.round(2)}")

prompt('Would you like to print out a loan schedule?')
do_schedule = gets.chomp.downcase
if do_schedule.start_with?('y')
  loan_schedule(amount, rate, duration_months, monthly_payment)
end
