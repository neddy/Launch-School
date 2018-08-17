# Given a string made of digits [0-9], return a string where each digit is repeated a number of times equals to its value.

# I:string
# O:string
# F:
# Split string into digits
# covert each digit to integer
# multiple original string by integer
# join new strings back togther and return

def digits_explode(str)
  str.chars.map do |n|
    n * n.to_i
  end.join
end

p digits_explode("312") == "333122"
p digits_explode("102269") == "12222666666999999999"
