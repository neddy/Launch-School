# ex_5.rb

class MinilangError < StandardError; end
class InvalidToken < MinilangError; end
class StackEmpty < MinilangError; end

class Minilang

  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  def initialize(string)
    @cmd_string = string
  end

  def eval
    @stack = []
    @register = 0
    eval_commands
  rescue MinilangError => error
    puts error.message
  end

  def eval_commands
    @cmd_string.split.each do |cmd|
      if COMMANDS.include?(cmd)
        send(cmd.downcase)
      elsif cmd.to_i.to_s == cmd
        @register = cmd.to_i
      else
        raise InvalidToken, "Invalid Token: #{cmd}"
      end
    end
  end

  def push
    @stack << @register
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def pop
    if @stack.empty?
      raise StackEmpty, "Stack Empty!!"
    else
      @register = @stack.pop
    end
  end

  def print
    puts @register
  end
end






Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
