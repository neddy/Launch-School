# Create a method that can take a string with 3 words that describe a mathimatical operation, and convert that into the correct result. Return an integer
#
# Understant the problem
# take a string, then break up the string and take the 3 elements
# the first is a number as a word
# the second is the operator
# the third is the second number
#
# Data
# I: string
# O: integer
#
# Solution
# split the string into an array
# convert the first and third elements to numbers
# Then assess which operator is specified and preform the correct operation with the two numbers
#
# convert numbers
# create hash of numbers and words
# match input to hash keys and return numbers

def start_index(array)
  index = array.find_index{ |el| el == 'divided' || el == 'times' }
  index ? (index - 1) : 0
end

def convert_numbers(array)
  numbers = %w(zero one two three four five six seven eight nine)
  array.map! do |el|
    if numbers.index(el)
      numbers.index(el)
    elsif el.to_i.to_s == el
      el.to_i
    else
      el
    end
  end
end

def computer(string)
  string.gsub!('divided by', 'divided')
  remaining_calculations = convert_numbers(string.split)
  starting_index = start_index(remaining_calculations)
  current_calculation = remaining_calculations.slice!(starting_index, 3)
  first_num, operation, second_num = current_calculation
  result =  case operation
            when 'plus'
              first_num + second_num
            when 'minus'
              first_num - second_num
            when 'times'
              first_num * second_num
            when 'divided'
              first_num / second_num
            end
  if remaining_calculations.size > 0
    remaining_calculations.insert(starting_index, result)
    result = computer("#{remaining_calculations.join(' ')}")
  end
  result
end

p computer('seven minus six') == 1
p computer('zero plus eight') == 8
p computer('eight times four plus six divided by two minus 2') == 33
p computer('three minus one plus five minus 4 plus 10 minus four times 5 divided by 2')
p computer('two plus two plus one')
p computer('two plus four divided by two')
p computer('three minus one plus five minus 4 plus 10 minus four')
p computer('three minus one plus five minus 4 plus 10 minus four times 5 divided by 2')
p computer('two plus two')


def computer(string)
  string.gsub!('divided by', 'divided')
  remaining_calculations = convert_numbers(string.split)
  result = 0
  loop do
    starting_index = start_index(remaining_calculations)
    current_calculation = remaining_calculations.slice!(starting_index, 3)
    first_num, operation, second_num = current_calculation
    result =  case operation
              when 'plus'
                first_num + second_num
              when 'minus'
                first_num - second_num
              when 'times'
                first_num * second_num
              when 'divided'
                first_num / second_num
              end
    break if remaining_calculations.size == 0
    remaining_calculations.insert(starting_index, result)
  end
  result
end

p computer('seven minus six') == 1
p computer('zero plus eight') == 8
p computer('eight times four plus six divided by two minus 2') == 33
p computer('three minus one plus five minus 4 plus 10 minus four times 5 divided by 2')
p computer('two plus two plus one')
p computer('two plus four divided by two')
p computer('three minus one plus five minus 4 plus 10 minus four')
p computer('three minus one plus five minus 4 plus 10 minus four times 5 divided by 2')
p computer('two plus two')
