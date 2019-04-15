def hello
  yield
  "hello!"
end

# puts hello

p hello { puts 'hi' }
