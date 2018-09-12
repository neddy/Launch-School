# ex_10.rb
# Nobility
# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.
#
# We need a new class Noble that shows the title and name when walk is called:
#
# byron = Noble.new("Byron", "Lord")
# p byron.walk
# # => "Lord Byron struts forward"
# We must have access to both name and title because they are needed for other purposes that we aren't showing here.
#
# byron.name
# => "Byron"
# byron.title
# => "Lord"

module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_accessor :title
  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} " + super
  end

  private
  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"

puts byron.name
# => "Byron"
puts byron.title
# => "Lord"
