# ex_5.rb
# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

first =   flintstones.find_index do |name|
            name[0, 2] == 'Be'
          end

p first
