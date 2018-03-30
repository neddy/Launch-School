# ex_4.rb

def is_an_ip_number?(num)
  (0..255).include?(num.to_i)
end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    return true
  else
    return false
  end
end

puts dot_separated_ip_address?("10.0.0.1")
puts dot_separated_ip_address?("0.0.0")
