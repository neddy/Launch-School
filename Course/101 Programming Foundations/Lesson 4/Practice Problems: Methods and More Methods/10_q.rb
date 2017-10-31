# 10_q.rb
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# Returns [1, nil, nil]
