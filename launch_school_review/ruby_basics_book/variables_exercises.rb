# Variable Exercises

# Exercise 1. Write a program called name.rb that asks the user to type in their 
# name and then prints out a greeting message with their name included.

# name.rb

puts "Please type in your name"
name = gets.chomp

puts "Hello #{name} welcome!"

# Exercise 2. Write a program called age.rb that asks a user how old they are and 
# then tells them how old they will be in 10, 20, 30 and 40 years. 
# Below is the output for someone 20 years old.

# age.rb

puts "How old are you?"
age = gets.chomp.to_i

puts "In 10 years you will be:"
puts age + 10
puts "In 20 years you will be:"
puts age + 20
puts "In 30 years you will be:"
puts age + 30
puts "In 40 years you will be:"
puts age + 40

# Exercise 3. Add another section onto name.rb that prints the name of the user 10 
# times. You must do this without explicitly writing the puts method 10 times 
# in a row. Hint: you can use the times method to do something repeatedly.

# name.rb continued

puts "Please type in your name"
name = gets.chomp

10.times do
  puts name
end

# Exercise 4. Modify name.rb again so that it first asks the user for their 
# first name, saves it into a variable, and then does the same for the last name. 
# Then outputs their full name all at once.

# name.rb continued again

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello " + first_name + " " + last_name

# Exercise 5. Look at the following programs...

# x = 0
# 3.times do
#   x += 1
# end
# puts x

# and...

# y = 0
# 3.times do
#   y += 1
#   x = y
# end
# puts x

# What does x print to the screen in each case? Do they both give errors? 
# Are the errors different? Why?

# 1st case: x prints 3
# 2nd case: an error happens because x isn't initialized outside of the block.
#           therefore x is not avaialble as it was created within the scope of 
#           the do/end block.

# Exercise 6. What does the following error message tell you?

# NameError: undefined local variable or method `shoes' for main:Object
#   from (irb):3
#   from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# Error is telling us we have an undefiend local variable or method called 'shoes'



