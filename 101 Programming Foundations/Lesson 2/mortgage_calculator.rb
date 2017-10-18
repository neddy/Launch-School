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

def two_decimal_places?(input)
  # Check if float has 2 or less decimal places
  case
  when format('%.2f', input) == input
    true
  when format('%.2f', input) == '0' + input
    true
  when format('%.2f', input) == input + '0'
    true
  when format('%.2f', input) == '0' + input + '0'
    true
  else
    false
  end
end

def enter_integer
  number = ''
  loop do
    number = gets.chomp
    break if integer?(number)
    prompt("Please only enter whole numbers without any symbols,"\
      " please try again...")
  end
  number.to_i
end

def enter_number
  number = ''
  loop do
    number = gets.chomp
    break if float?(number) || integer?(number)
    prompt("Please only enter valid numbers without any symbols."\
      " Please try again...")
  end
  number
end

def enter_number_2_decimals
  rate = ''
  loop do
    rate = enter_number()
    if integer?(rate) || two_decimal_places?(rate)
      break if rate.to_f >= 0
      prompt('Please enter an interest rate of 0 or greater.')
    else
      prompt('Please only enter numbers with up to 2 decimal places,'\
        ' please try again...')
    end
  end
  rate.to_f
end

def loan_amount
  prompt("Please enter the loan amount in whole dollars excluding the '$'"\
    " and any decimals.")
  amount = 0
  loop do
    amount = enter_integer()
    break if amount > 0
    prompt('Please enter an amount great than 0.')
  end
  amount
end

def interest_rate
  prompt("Please enter the interest rate. You can enter an interst rate"\
    " with up to 2 decimal places. eg: 5.55 (Please exclude the '%' sign.)")
  enter_number_2_decimals
end

def loan_duration
  duration_months = 0
  prompt('Please enter the loan duration in years and / or months below:')
  loop do
    prompt('Please enter the number of years')
    duration_months = enter_integer() * 12
    prompt('Please enter the number of months')
    duration_months += enter_integer()
    break if duration_months > 0
    prompt('You must enter a loan duration and it must be greater than 0')
  end
  duration_months
end

def payment_calculator(amount, rate, duration_months)
  if rate == 0
    amount.to_f / duration_months
  else
    monthly_rate = (rate / 12) / 100
    p = amount
    j = monthly_rate
    n = duration_months
    p * (j / (1 - (1 + j)**-n))
  end
end

def format_dollars(num)
  format('$%.2f ', num)
end

def format_rate(rate)
  format('%.2f%', rate)
end

def continue?
  loop do
    continue = gets.chomp.downcase
    if continue == 'y' || continue == 'yes'
      return true
    elsif continue == 'n' || continue == 'no'
      return false
    else
      prompt('please enter either yes or no (y/n)')
    end
  end
end

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
  display_loan_schedule(amount, rate, monthly_payment, loan_schedule)
end

def display_loan_schedule(amount, rate, monthly_payment, loan_schedule)
  prompt("Initial loan amount:   $#{amount}")
  prompt("Interest Rate:         #{format_rate(rate)}")
  prompt("Monthly Payment:       #{format_dollars(monthly_payment)}")
  printf("|%7s|%15s|%15s|%15s|\n", 'Month ', 'Interest ', 'Principal ',\
         'Outstanding ')
  puts '---------------------------------------------------------'
  loan_schedule.each_with_index do |loan, month|
    printf("|%7s|%15s|%15s|%15s|\n", month.to_s, format_dollars(loan[0]),\
           format_dollars(loan[1]), format_dollars(loan[2]))
  end
end

prompt('Welcome to the mortgage / loan calculator')
amount, rate, duration_months = 0

loop do
  amount = loan_amount()
  rate = interest_rate()
  duration_months = loan_duration()
  prompt("You have entered the following details:")
  prompt('----------------------------------------')
  prompt("Loan amount  :    $#{amount}")
  prompt("Interest rate:    #{format_rate(rate)}")
  prompt("Loan duration:    #{duration_months / 12} years"\
    " #{duration_months % 12} months")
  prompt('----------------------------------------')
  prompt('Are these details correct? (y/n)')
  break if continue?()
  prompt('Would you like to re-enter the details and try again? (y/n)')
  exit unless continue?()
end

monthly_payment = payment_calculator(amount, rate, duration_months)
prompt('----------------------------------------')
prompt("Your monthly payment will be: $#{monthly_payment.round(2)}")
prompt('----------------------------------------')

prompt('Would you like to print out a loan schedule? (y/n)')
if continue?()
  loan_schedule(amount, rate, duration_months, monthly_payment)
end
