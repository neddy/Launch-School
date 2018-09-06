# 4_q.rb
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# Returns a hash, with the first letter of each string as the key, and the string as the value
# { "a" => "ant", "b" => "bear", "c" => "cat" }
