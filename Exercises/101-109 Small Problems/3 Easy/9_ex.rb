# 9_ex.rb

def real_palindrome?(input)
  input.gsub!(/[^0-9a-z]/i, '')
  input.downcase!
  input == input.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

def palindrome?(input)
  input == input.reverse
end

def real_palindrome_r?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

puts real_palindrome_r?('madam') == true
puts real_palindrome_r?('Madam') == true           # (case does not matter)
puts real_palindrome_r?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome_r?('356653') == true
puts real_palindrome_r?('356a653') == true
puts real_palindrome_r?('123ab321') == false
