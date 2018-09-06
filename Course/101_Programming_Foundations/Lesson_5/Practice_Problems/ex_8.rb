# ex_8.rb
# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeiouAEIOU'

def find_vowels(string)
  vowels_found = ''
  string.split('').each do |x|
    vowels_found << x if VOWELS.include?(x)
  end
  vowels_found
end

vowels_found = ''
hsh.each do |record|
  vowels_found << find_vowels(record[1].join)
end

puts vowels_found

# Suggested solution

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
