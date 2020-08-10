# ex_1.rb

def step(value1, value2, step_value)
  current_value = value1
  while current_value <= value2 do
    yield(current_value)
    current_value += step_value
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
