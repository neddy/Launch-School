# ex_3.rb
# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

#Answers
# To find the lookup path for an object, we can call the class method `ancestors` on the class we wish to find ancestors for. Thsi will show the ancestors of the class, this is also called the lookup path.

p Orange.ancestors
