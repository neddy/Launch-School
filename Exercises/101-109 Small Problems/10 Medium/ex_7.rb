# ex_7.rb
# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
#
# Example:



NUMBERS = %w(zero one two three four five six seven eight nine)


def word_to_digit(string)
  numbers_hsh = {}
  NUMBERS.each_with_index { |n, i| numbers_hsh[n] = i }
  string = string.gsub(/([[:punct:]])/, " \\1")
  words = string.split.map do |word|
    if NUMBERS.include?(word.downcase)
      numbers_hsh[word.downcase]
    else
      word
    end
  end
  words.join(" ").gsub(/(\s)([[:punct:]])/, "\\2")
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

def word_to_digit(string)
  numbers_hsh = {}
  NUMBERS.each_with_index { |n, i| numbers_hsh[n] = i.to_s }
  new_string = ""
  digit_found_last = false
  string.split.each_with_index do |word, index|
    clean_word = word.gsub(/[[:punct:]]/, '').downcase
    if NUMBERS.include?(clean_word)
      if digit_found_last
        new_string = new_string[0..-2]
      end
        digit_string = word.gsub!(/\b#{clean_word}\b/i, numbers_hsh[clean_word])
        new_string << "#{digit_string} "
        digit_found_last = true
    else
      new_string << "#{word} "
      digit_found_last = false
    end
  end
  new_string.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  new_string.strip
end

p word_to_digit('Please call, me at +1 Five FIVE five one two three four five five five. Thanks.')
#=> "Please call, me at +1 (555) 123-4555. Thanks."
p word_to_digit('Test existing digits 0 00 0 one two three four five six')
#=> "Test existing digits 0 00 0 123456"
p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5551234. Thanks.'
