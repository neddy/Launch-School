# ex_1.rb
# Banner Class
# Behold this incomplete class for constructing boxed banners.
#
# class Banner
#   def initialize(message)
#   end
#
#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end
#
#   private
#
#   def horizontal_rule
#   end
#
#   def empty_line
#   end
#
#   def message_line
#     "| #{@message} |"
#   end
# end
# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.
#
# You may assume that the input will always fit in your terminal window.
#
# Test Cases
#
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

class Banner
  def initialize(message, length = nil)
    @message = message
    set_length(length)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :length, :message

  def set_length(length)
    if length && length.even?
      @length = length > message.size + 2 ? length : message.size
    else
      @length = message.size
    end
  end

  def horizontal_rule
    "+" + "-" * (length + 2) + "+"
  end

  def empty_line
    "|" + " " * (length + 2) + "|"
  end

  def message_line
    extra_space_each_side = (length - message.size) / 2
    "| " + (" " * extra_space_each_side) + message  + (" " * extra_space_each_side) + " |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner

banner = Banner.new('', 6)
puts banner
