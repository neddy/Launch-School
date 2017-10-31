# 5_q.rb
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |x| x[0, 2] == 'Be'}
