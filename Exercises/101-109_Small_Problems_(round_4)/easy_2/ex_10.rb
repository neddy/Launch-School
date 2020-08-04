# ex_10.rb

# Mutation
# What will the following code print, and why? Don't run the code until you have tried to answer.
#
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2

This will output all the strings from array1 with words starting with 'C' or 'S' being in uppercase.

This is because each string from array1 is appended to array2 on line 3. Then on line 4 each string in array1 that starts with a 'C' or an 'S' is mutated by calling `upcase!` on those strings.

Then on line 5, each string in array2 is output, these variables are all the same as array1
