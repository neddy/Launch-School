# Understand the problem
#
# The program should take either a string or an integer. All integers should be treated as base 10, and all strings should be treated a binary. If an invalid binary is input, consider the value to be 0.
#
# Secrtet handshakes are defined using binary numbers.

# Commands (bianary)
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
#
# 10000 = Reverse - This reverses the order of the array that is returned.

# To calculate the secret handshake, subtract the highest value command possible from the number without going below zero. Then take the remainder and do it again. Each command should be added to an array that will be returned at the end. Each 'reverse' command should reverse the order of the returned array.


# # Data structure
#
# The secret handshake commands will be stored in a hash, with their decimal equivalents


# # The Solution
#
# Take the input, if it's an integer, store it to be used later. If it's a binary, convert it to decimal. Next, divide the number by the value of the highest command (16 - reverse), the answer will be the number of times the resulting array should be reversed. Next, take the remainder and divide it by each of the command values. If the number is divisible by the command value, add teh command to the array, then take the remainder and repeat the process for each of the remaining commands.

# class SecretHandshake
#   # attr_reader :input_num
#
#   COMMANDS = [
#     [8, "jump"],
#     [4, "close your eyes"],
#     [2, "double blink"],
#     [1, "wink"]
#   ]
#
#   REVERSE = 16
#
#   def initialize(input)
#     @input_num = if is_integer?(input)
#                    input
#                  else
#                    convert_binary(input)
#                  end
#   end
#
#   def commands
#     value_left = @input_num
#     handshake_commands = []
#     reverses, value_left = value_left.divmod(REVERSE)
#
#     COMMANDS.each do |value, command|
#       current_command, value_left = value_left.divmod(value)
#       handshake_commands.prepend(command) if current_command == 1
#     end
#
#     reverses.times { handshake_commands.reverse!}
#     handshake_commands
#   end
#
#   private
#
#   def is_integer?(input)
#     input.to_s.to_i == input
#   end
#
#   def convert_binary(input)
#     return 0 if input.match(/[^01]/)
#
#     input_value = 0
#     input.chars.reverse.each_with_index do |num, power|
#       input_value += num.to_i * 2 ** power
#     end
#     input_value
#   end
# end

# handshake = SecretHandshake.new 9
# p handshake.commands
#
# handshake = SecretHandshake.new "11001"
# p handshake.commands
#
# handshake = SecretHandshake.new "0101 fdas 11001"
# p handshake.commands

class SecretHandshake
  EVENTS = ["wink", "double blink", "close your eyes", "jump"]

  def initialize(input)
    @binary = if valid_integer?(input)
                integer_to_binary(input)
              elsif valid_binary?(input)
                input
              else
                0
              end
  end

  def commands
    return [] if @binary == 0

    event_switches = @binary.reverse.chars

    events = EVENTS.select.with_index do |_, idx|
               event_switches[idx] == "1"
             end

    if event_switches[4] == "1"
      events.reverse
    else
      events
    end
  end

  private

  def integer_to_binary(n)
    n.to_s(2)
  end

  def valid_integer?(input)
    input.is_a?(Integer)
  end

  def valid_binary?(input)
    input.to_i(2).to_s(2) == input
  end
end

# handshake = SecretHandshake.new 9
# p handshake.commands
#
# handshake = SecretHandshake.new "111"
# p handshake.commands
#
# handshake = SecretHandshake.new "0101 fdas 11001"
# p handshake.commands
