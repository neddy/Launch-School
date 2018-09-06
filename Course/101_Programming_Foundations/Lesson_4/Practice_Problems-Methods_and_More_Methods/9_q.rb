# 9_q.rb
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Returns [nil, "bear"]
# First value is nil as the if statement evaluates false and returns nil
# Second value is 'bear' because the if statement evaluates to true and the value is assigned to the array
