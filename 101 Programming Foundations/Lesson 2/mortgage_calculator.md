__Problem to solve:__

Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

You'll need three pieces of information:

the loan amount
the Annual Percentage Rate (APR)
the loan duration

From the above, you'll need to calculate the following two things:

monthly interest rate
loan duration in months

You can use the following formula
```ruby
m = p * (j / (1 - (1 + j)**(-n)))
```

__ Understand the Problem __
*(Describe the problem. Requirements. Rules and Implicit Knowledge, Important Terms)*
Take a loan amount, the interest rate and the duration of the loan and calculate the monthly repayment amount.


__ Examples / Test Cases __
*(Input / Output, Edge Cases? Bad input?)*

loan amount: $100, interest rate 12%, duration 1 month. Expected output: $101
loan amount: $100, interest rate 12%, duration 12 month. Expected output: $8.88

__ Data Structures __
*(What data structure fits the problem and the input data?)
(Rules / requirements for input data?)*

inputs:
loan amount: integer (Only take loan amounts in whole numbers)
Interest rate: float (in the format of 0.00 without the '%' sign)
Loan duration: integer (will take months and years over two prompts)

Outputs:
monthly payment amount: float (rounded to 2 decimal places)


__ Algorithm __
*(Create algorithm using language of chosen data structure)*

LOOP
  GET loan amount in whole dollars and
  SET to loan_amount
  BREAK IF loan_amount is integer
END LOOP

LOOP
  GET interest rate eg: 5.00 or 5 for 5%
  SET interest_rate
  BREAK IF interest_rate is interest_rate integer
  BREAK IF interest_rate is float with up to 2 decimal places
END LOOP

LOOP
  GET loan duration years
  GET loan duration months
  BREAK IF years is integer or empty
  BREAK IF months is integer or (IF months empty and year is integer)
END LOOP

SET loan_duration_months = years / 12
SET loan_duration_months = loan_duration_months + months
PRINT loan duration for confirmation
CALCULATE loan payments
PRINT monthly loan repayments
CHECK if user would like to change loan duration to adjust payment amount
RECALCULATE loan repayments with new duration if requested.

EXTRA:
output loan schedule in months to screen and file if requested.
TAKE details above

LOOP for months in loan_duration
  CALCULATE interest on outstanding amount
  ADD interest for month to total
  SUBTRACT repayment from total
  OUTPUT amount_still owing after interest and repayment
END






__ Abstraction __
*(Solve in 1-2 sentences, solve small problems)*



__ Code Below __
