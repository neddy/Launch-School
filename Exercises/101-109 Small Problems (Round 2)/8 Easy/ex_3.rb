# ex_3.rb
## Leading Substrings
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
#
# Examples:

# substrings_at_start('abc') == ['a', 'ab', 'abc']
# substrings_at_start('a') == ['a']
# substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

## Understand the problem
# create a list of substrings of a string starting with the first character, then adding one character to each subsequent string

## Tests as above

## Data Structure
# Store substrings in an array
# store string as string

## Algorithm
# split string and iterate over characters
# slice string from first character to the current index in that iteration
# add sliced string to array
# return array


def substrings_at_start(string)
  substrings = []
  string.chars.each_with_index do | _, idx |
    substrings << string.slice(0..idx)
  end
  substrings
end

p substrings_at_start('abc')

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
