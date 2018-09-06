# ex_8.rb
# Using the each method, write some code to output all of the vowels from the strings.

vowels = 'aeiou'

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each do |_, arr|
  arr.each do |str|
    str.each_char do |chr|
      puts chr if vowels.include?(chr.downcase)
    end
  end
end
