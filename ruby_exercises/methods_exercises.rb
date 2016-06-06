# Ruby methods_exercises.rb 

# Exercise 1:

# Question: Write a program that prints a greeting message. 
# This program should contain a method called greeting that takes a name 
# as its parameter and returns a string.

def greeting(name)
  puts "Hello #{name} how are you?"
end

greeting("James")

# Exercise 2:

# Question: What do the following expressions evaluate to?

=begin 

1. x = 2   # 2

2. puts x = 2   # nil

3. p name = "Joe"   # "Joe"

4. four = "four"  # "four"

5. print something = "nothing"    # nil

=end 

# Exercise 3:

# Question: Write a program that includes a method called multiply that 
# takes two arguments and returns the product of the two numbers.

def multiply(num1, num2)
  answer = (num1 * num2)
  puts answer
end

multiply(3, 6)

# Exercise 4:

# Question: What will the following code print to the screen?

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

# Outputs nothing because the return interupts the puts words part of the program.

# Exercise: 5

# Question: 1) Edit the method in exercise #4 so that it does print words 
# on the screen. 2) What does it return now?

def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")

# Outputs "Yippeee!!!!" returns nil

# Exercise 6:

# Question: What does the following error message tell you?

=begin 
ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
=end 

# method calculate_product calls for two arguments and only one was given.





