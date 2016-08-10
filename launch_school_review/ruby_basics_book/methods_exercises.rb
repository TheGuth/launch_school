# Methods Exercises

# Exercise 1. Write a program that prints a greeting message. 
# This program should contain a method called greeting that takes a name as its 
# parameter and returns a string.

def greeting(name)
  puts "Hello #{name}"
end

greeting('james')

# Exercise 2. What do the following expressions evaluate to?

# 1. x = 2  / returns 2

# 2. puts x = 2  / returns nil

# 3. p name = "Joe"  / returns "Joe"

# 4. four = "four"   / returns "four"

# 5. print something = "nothing"  returns nil

# Exercise 3. Write a program that includes a method called multiply that takes 
# two arguments and returns the product of the two numbers.

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 5)

# Exercise 4. What will the following code print to the screen?

# def scream(words)
#   words = words + "!!!!"
#   return
#   puts words
# end

# scream("Yippeee")

# it will print nothing to the screen because the program returns before puts words.

# Exercise 5. 1) Edit the method in exercise #4 so that it does print words on the 
# screen. 2) What does it return now?

def scream(words)
  words = words + "!!!!!"
  puts words
end

scream("Yippeee")

# still returns nil because of the puts

# Exercise 6. What does the following error message tell you?

# ArgumentError: wrong number of arguments (1 for 2)
#   from (irb):1:in `calculate_product'
#   from (irb):4
#   from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'

# The error message tells us we have the wrong number of arguments.
# we gave only 1 argument instead of 2.