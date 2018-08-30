# ex_5.rb
# Let's add a to_s method to the class:

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

  def to_s
    name
  end

  private

  def parse_name(full_name)
    names = full_name.split(' ')
    self.first_name = names[0]
    self.last_name = names.size > 1 ? names[-1] : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
