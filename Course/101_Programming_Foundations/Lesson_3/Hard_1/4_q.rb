# 4_q.rb

def is_an_ip_number?(input)
  if input.to_i.to_s == input
    return true if (0..255).include?(input.to_i)
  end
  false
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?('8.8.8.8')        # True
p dot_separated_ip_address?('192.168.0.1')    # True
p dot_separated_ip_address?('192.168.0.1.5')  # False
p dot_separated_ip_address?('192.168.0')      # False
p dot_separated_ip_address?('192.168.0.256')  # False
p dot_separated_ip_address?('192.168.0.')     # False
p dot_separated_ip_address?('19fdsafd')       # False
