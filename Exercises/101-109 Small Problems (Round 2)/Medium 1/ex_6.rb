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
# (nothing printed; no PRINT commands)

# Understand the problem
# Create a program that follows a simple set of rules:
#   n Place a value n in the "register". Do not modify the stack.
#   PUSH Push the register value on to the stack. Leave the value in the register.
#   ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
#   SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
#   MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
#   DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#   MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#   POP Remove the topmost item from the stack and place in register
#   PRINT Print the register value
#
# Only one operation if preformed at a time, either placing an item in the register, moving the register to the stack, or preforming a calculation.
#
# When a calculation if preformed, a value is taken from the stack, then that value and the register are used to preform the calculation, with the result to be stored back in the register.

# Data
# I: string
# O: print to screen
# A: array for stack
# array of commands
# integer for register

# Algorithm / steps
# split string into seperate commands
# iterate over commands
# case command
#   n
#     place value in register
#   push
#     move register to stack
#   pop
#     move top most value in stack to register
#   print
#     print register
#   add, sub, multi, div, mod
#     call operation method with stack, register and operation as arguments, assign register value on return
#   end case
#   return exit code 0
# end
#
#
# def operation method
#   case
#     add
#       take top value from stack, add with register, and replace register with result
#     sub
#       take top value from stack, subtract from register, and replace register with result
#     multi
#       take top value from stack, multiply with register, and replace register with result
#     div
#       take top value from stack, divide into register, and replace register with result
#     mod
#       take top value from stack, divide into register, and replace register with remainder
#   case end
#
#   return register and stack
# end

def operation(stack, register, operation)
  case operation
  when 'ADD'
    register = stack.pop + register
  when 'SUB'
    register = register - stack.pop
  when 'MULT'
    register = register * stack.pop
  when 'DIV'
    register = register / stack.pop
  when 'MOD'
    register = register % stack.pop
  end
  register
end

def minilang(commands)
  array_commands = commands.split(' ')
  stack = []
  register = 0
  array_commands.each do |command|
    case command
    when command.to_i.to_s
      register = command.to_i
    when 'PUSH'
      stack << register
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    else
      register = operation(stack, register, command)
    end
  end
  return 0
end

# p operation([1,2], 2, 'ADD')

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')
