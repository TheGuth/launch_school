# You may remember our Minilang language from back in the 101 Advanced exercises.
# We return to that language now, but this time we'll be using OOP.

# Write a class that implements a miniature stack-and-register-based programming
# language that has the following commands:

# n Place a value n in the "register"

# PUSH Push the register value on to the stack

# ADD Add value on stack to the register value

# SUB Subtract value on stack from the register value

# MULT Multiply value on stack by the register value

# DIV Divide value on stack into the register value

# MOD Divide value on stack into the register value and leave remainder

# POP Remove item from stack and place in register

# PRINT print the register value

# ADD, SUB, MULT, DIV, and MOD all remove the topmost item from the stack,
# perform the operation, and leave the result in the register.

# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an 
# argument. Your program should produce an error if an unexpected item is present
# in the string, or if a required stack value is not on the stack when it should be 
# (the stack is empty). In all error cases, no further processing should be performed
# on the program.

# You should initialize the register to 0.

class MiniLang
  def initialize(string)
    @register = 0
    @program = string.split(' ')
    initialize_program(@program)
  end

  def initialize_program(array)

  end

  def stack(array)

  end

  def n

  end

  def push

  end

  def print
    @register
  end
end

# Examples:

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