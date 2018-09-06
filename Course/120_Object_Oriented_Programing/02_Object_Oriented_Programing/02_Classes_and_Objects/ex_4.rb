# ex_4.rb
# Using the class definition from step #3, let's create a few more people -- that is, Person objects.

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

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name


# Added in comparable to see if it would work...
# class Person
#   attr_accessor :first_name, :last_name
#   include Comparable
#
#   def initialize(full_name)
#     parse_name(full_name)
#   end
#
#   def name
#       "#{first_name} #{last_name}".strip
#   end
#
#   def name=(full_name)
#     parse_name(full_name)
#   end
#
#   def <=>(anOther)
#     name <=> anOther.name
#   end
#
#   private
#
#   def parse_name(full_name)
#     names = full_name.split(' ')
#     self.first_name = names[0]
#     self.last_name = names.size > 1 ? names[-1] : ''
#   end
# end
#
# p bob == rob
