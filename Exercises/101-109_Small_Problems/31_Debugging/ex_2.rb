# ex_2.rb
# HEY YOU!
# String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU?

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you')

# The output is 'HEY you' and not 'HEY YOU' because on line 2 the code calls the methrod STRING#upcase! on an array created from the characters of the variable 'name'. The resulting array of upercase letters was not used after that point, adn the original variable 'name' with object 'you' was not modified.
