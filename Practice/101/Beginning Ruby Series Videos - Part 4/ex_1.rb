# Write a method that takes a string and returns the string in reverse

# Understand the problem
# Take a string, return it's revese without using the reverse method

# Examples
#
# string_reverse("Test") == "tseT"
# string_reverse("What about this?") == "?siht tuoba tahW"

# Data
# I: string
# O: String
# A: convert to Array to process

# Algorithm
# split string into array of characters
# create empty new_string
# iterate over array
#   add each element to start of new_string
# end iteration
# return new string


def string_reverse(string)
  new_string = ''
  string.chars.each do |char|
    new_string.prepend(char)
  end
  new_string
end

p string_reverse("Test")
p string_reverse("Test") == "tseT"
p string_reverse("What about this?") == "?siht tuoba tahW"
