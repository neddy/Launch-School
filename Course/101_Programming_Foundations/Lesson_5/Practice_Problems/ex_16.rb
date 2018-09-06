# ex_16.rb
uuid = ''

possible_chars = ('a'..'z').to_a
possible_chars << ('0'..'9').to_a

32.times do
  uuid += possible_chars.sample
end

puts uuid
