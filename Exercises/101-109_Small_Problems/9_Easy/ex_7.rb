# ex_7.rb
# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.
#
# Examples

def swap_name(fullname)
  firstname, lastname = fullname.split
  "#{lastname}, #{firstname}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
