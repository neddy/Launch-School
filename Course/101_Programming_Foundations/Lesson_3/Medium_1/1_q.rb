# 1_q.rb
statement = 'The Flintstones Rock!'
10.times {puts statement.prepend(' ')}

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
