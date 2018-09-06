# ex_2.rb
# Delete vowels

# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.
#
# Example:

def remove_vowels(arr)
  arr.each do |string|
    string.gsub!(/[aeiou]/i, '')
  end
  arr
end

puts remove_vowels(%w(green YELLOW black white))

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
