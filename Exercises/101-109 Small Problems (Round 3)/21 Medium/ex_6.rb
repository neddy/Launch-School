# ex_6.rb
# Stack Machine Interpretation
# A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.
#
# A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.
#
# Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.
#
# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:
#
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).
#
# Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.
#
# You should initialize the register to 0.

# Examples:
#
# minilang('PRINT')
# # 0
#
# minilang('5 PUSH 3 MULT PRINT')
# # 15
#
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
#
# minilang('5 PUSH POP PRINT')
# # 5
#
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
#
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
#
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
#
# minilang('-3 PUSH 5 SUB PRINT')
# # 8
#
# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)


# Understand the problem
# Take a string, the string will be a list of commands as outlined above.
# when a number is in the list of commands, replace the register with that number
# when the command is an operation, use the register and pop the last number in the stack.
#
#
# Data
# I: string
# O: print to screen if asked, nothing returned
#
# Solution
# take the string, split into arguments
# initialise stack as []
# initialise register as 0
# use case statement to assess arguments.

# With error handling
def stack_empty(command, stack)
  if stack.empty?
    "Error, stack empty when trying to #{command}"
  else
    nil
  end
end

def stack_operation(command, stack, register)
  case command
  when 'ADD'
    register += stack.pop
  when 'SUB'
    register -= stack.pop
  when 'MULT'
    register *= stack.pop
  when 'DIV'
    register /= stack.pop
  when 'MOD'
    register %= stack.pop
  when 'POP'
    register = stack.pop
  end
  return stack, register
end


def minilang(command_string)
  register = 0
  stack = []
  command_string.split.each do |command|
    case command
    when command.to_i.to_s
      register = command.to_i
    when 'PUSH'
      stack << register
    when 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP'
      return stack_empty(command, stack) if stack_empty(command, stack)
      stack, register = stack_operation(command, stack, register)
    when 'PRINT'
      puts register
    else
      return "Invalid command detected: #{command}"
    end
  end
  nil
end


p minilang('5 POPP 3 MULT PRINT')
p minilang('5 POP 3 MULT PRINT')

minilang('PRINT') #=> 0

minilang('5 PUSH 3 MULT PRINT') #=> 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT') #=> 5 3 8

minilang('5 PUSH POP PRINT') #=> 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') #=> 5 10 4 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ') #=> 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ') #=> 12

minilang('-3 PUSH 5 SUB PRINT') #=> 8

minilang('6 PUSH')  #=> (nothing printed; no PRINT commands)
