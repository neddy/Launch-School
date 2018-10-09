# ex_1.rb
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:
hello = Hello.new
hello.hi
#=> outputs: 'Hello'

# case 2:
hello = Hello.new
hello.bye
#=> No method error

# case 3:
hello = Hello.new
hello.greet
# => Incorrect number of arguments error

# case 4:
hello = Hello.new
hello.greet("Goodbye")
#=> Outptu 'Goodbye'

# case 5:
Hello.hi
# No method error
