# Problem

Find the nth prime.

Don't use Ruby's `Prime` method or any prime methods from `Integer`.


# Data Structure
Store previously found primes in an array
Start array with [2, 3]

# Solution

If looking for first or second prime, return value from starting array

Iterate to next number, take square of the number, then test previous primes up to the square root of current number. 
If not divisible, add number to array.
Check if we have reached required prime number.


# Alternate Answer

Find blocks on primes until nth prime is within the blocks found.
