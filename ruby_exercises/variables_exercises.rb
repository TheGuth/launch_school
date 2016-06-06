# ruby variable_exercises.rb 

# Exercise 1:

# Question: Write a program called name.rb that asks the user to type in 
# their name and then prints out a greeting message with their name included.

# name.rb
puts "What is your name?"
name = gets.chomp
puts "Greetings #{name}"

# Exercise 2:

# Question: Write a program called age.rb that asks a user how old they are 
# and then tells them how old they will be in 10, 20, 30 and 40 years. 
# Below is the output for someone 20 years old.

# age.rb 
puts "How old are you"
age = gets.chomp    # 50
puts "In 10 years you will be:" 
puts age.to_i + 10    # 60
puts "In 20 years you will be:" 
puts age.to_i + 20    # 70
puts "In 30 years you will be:" 
puts age.to_i + 30    # 80
puts "In 40 years you will be:" 
puts age.to_i + 40    # 90

# Exercise 3:

# Question: Add another section onto name.rb that prints the name of the user
# 10 times. You must do this without explicitly writing the puts method 10 
# times in a row. Hint: you can use the times method to do something repeatedly.

# name.rb 
puts "What is your name?"
name = gets.chomp
10.times do |x|
  puts "Hello #{name}"
end

# Exercise 4:

# Question: Modify name.rb again so that it first asks the user for their 
# first name, saves it into a variable, and then does the same for the last 
# name. Then outputs their full name all at once.

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello #{first_name} #{last_name}"

# Exercise 5:

# Question: Look at the following programs...
=begin 

x = 0
3.times do
  x += 1
end
puts x

and...

y = 0
3.times do
  y += 1
  x = y
end
puts x

What does x print to the screen in each case? Do they both give errors? 
Are the errors different? Why?
=end

# program 1: x = 3

# program 2: error because x is undefined

# Exercise 6:

# Question: What does the following error message tell you?

=begin
NameError: undefined local variable or method `shoes' for main:Object
  from (irb):3
  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
Solution
=end

# the variable or method 'shoes' is undefined



