require 'pry'

class SecretHandshake
  REVERSE = 16
  SECRETS = {
    8 => "jump",
    4 => "close your eyes",
    2 => "double blink",
    1 => "wink"
  }

  def initialize(input)
    if input.instance_of?(Integer)
      @decimal_number = input
    elsif input.instance_of?(String) && valid_binary?(input)
      @decimal_number = input.to_i(2)
    else
      @decimal_number = 0
    end
  end

  def commands
    cmds_array = []
    reverses, remainder = @decimal_number.divmod(REVERSE)
    SECRETS.each do |value, cmd|
      cmds_array.prepend(cmd) if (remainder / value) >= 1
      remainder %= value
    end
    reverses.times { cmds_array.reverse! }
    cmds_array
  end

  private

  def valid_binary?(string)
    !/[^01]/.match(string)
  end
end




# p SecretHandshake.new(15).commands
