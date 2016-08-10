# Greeting through Methods Part 2

# Write a method named greet that invokes the following methods:

def say_hello
  'Hello'
end

def say_world
  'World'
end
# When greet is invoked with #puts, it should output the following:

# Hello World
# Make sure you add a space between "Hello" and "World", however, you're not allowed
# to modify say_hello or say_world.

def greet
  say_hello + " " + say_world
end

puts greet