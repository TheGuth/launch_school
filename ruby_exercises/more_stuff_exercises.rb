# Ruby more_stuff_exercises.rb 

# Exercise 1:

# Question: Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.

=begin
"laboratory"
"experiment"
"Pans Labyrinth"
"elaborate"
"polar bear"
=end

def lab_check(string)
  if /lab/.match(string)
    puts "Found the lab in #{string}!!"
  else
    puts "No lab!!!!"
  end
end

lab_check("laboratory")
lab_check("experiment")
lab_check("Pans Labyrinth")
lab_check("elaborate")
lab_check("polar bear")

# Exercise 2:

# Question: What will the following program print to the screen? What will it return?

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# puts nothing because the block hasn't been called with th .call 

def execute(&block)
  block.call  # code fixed with the .call method
end

execute { puts "Hello from inside the execute method!" }

# Exercise 3:

# Question: What is exception handling and what problem does it solve?

# Exception handling is a structure used to handle the possibility of an error
# occurring in a program. It is a way of handling the error by changing the 
# flow of control without exiting the program entirely.

# example of exception handling is as follows

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end

# Exercise 4:

# Question: Modify the code in exercise 2 to make the block execute properly

def execute(&block)
  block.call  # code fixed with the .call method
end

execute { puts "Hello from inside the execute method!" }

# Exercise 5:

# Question: Why does the following code...

=begin
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
Give us the following error when we run it?

block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'
=end

# The method parameter block is missing the ampersand sign & that allows a 
# block to be passed as a parameter.
























