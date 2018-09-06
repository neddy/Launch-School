################

# Given a string made of digits [0-9], return a string where each digit is repeated a number of times equals to its value.

# p digits_explode("312") == "333122"
# p digits_explode("102269") == "12222666666999999999"

def digits_explode(string)
  string.chars.map{ |n| n * n.to_i }.join
end

p digits_explode("312") == "333122"
p digits_explode("102269") == "12222666666999999999"
