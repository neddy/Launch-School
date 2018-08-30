# ex_3.rb
# Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

# class Person
#   attr_accessor :first_name, :last_name
#   def initialize(first_name, last_name = '')
#     @first_name = first_name
#     @last_name = last_name
#   end
#
#   def name
#       "#{first_name} #{last_name}".strip
#   end
#
#   def name=(name)
#     full_name = name.split(' ')
#     self.first_name = full_name[0]
#     self.last_name = full_name.size > 1 ? full_name[-1] : ''
#   end
# end
#
# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'
#
# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

class Person
  attr_accessor :first_name, :last_name
  def initialize(full_name)
    parse_name(full_name)
  end

  def name
      "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_name(full_name)
  end

  private

  def parse_name(full_name)
    names = full_name.split(' ')
    self.first_name = names[0]
    self.last_name = names.size > 1 ? names[-1] : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
