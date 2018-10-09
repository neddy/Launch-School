# ex_5.rb
#

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

#ANS

# This will output:
# 'ByeBye'
# 'HelloHello'
