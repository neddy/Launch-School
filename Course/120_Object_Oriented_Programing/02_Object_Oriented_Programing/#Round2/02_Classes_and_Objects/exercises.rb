# ex_2.rb
#

class Person
  attr_accessor :first_name, :last_name
  def initialize(name)
    self.name = name
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    names = name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end

  def ==(other)
    name == other.name && name == other.name
  end

  def to_s
    name
  end
end



bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
puts bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'


bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob == rob
