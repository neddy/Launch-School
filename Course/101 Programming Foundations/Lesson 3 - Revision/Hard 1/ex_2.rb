# ex_2.rb
=begin

Question 2
What is the result of the last line in the code below?
=end

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

=begin
The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object. The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it. This means that the original object was changed, thereby impacting the value in greetings. If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:

we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.
=end
