# Ruby basic_exercises.rb

# Exercise 1: 

# Question: Add two strings together that, when concatenated, 
# return your first and last name as your full name in one string.

puts "James" + "Guthrie"

# Exercise 2:

# Question: Use the modulo operator, division, or a combination of both to 
# take a 4 digit number and find the digit in the:
# 1) thousands place
# 2) hundreds place
# 3) tens place
# 4) ones place
                           # Example:
thousands = 9876 / 100 / 10 # 9        # thousands = 4936 / 1000
hundreds = 9876 /100 % 10 # 8         # hundreds = 4936 % 1000 / 100
tens = 9876 /10 % 10 # 7          # tens = 4936 % 1000 % 100 / 10
ones = 9876 % 100 % 10 # 6        #  ones = 4936 % 1000 %100 % 10

# Exercise 3:

# Question: Write a program that uses a hash to store a list of movie titles 
# with the year they came out. Then use the puts command to make your 
# program print out the year of each movie to the screen. 
# The output for your program should look something like this.

movie_hash = {
  harry_potter: "2001"
  lord_of_the_rings: "2004"
  star_wars_episode_vii: "2015"
  captain_america_civil_war: "2016"
}

puts movies_hash[:harry_potter]
puts movies_hash[:lord_of_the_rings]
puts movies_hash[:star_wars_episode_vii]
puts movies_hash[:captain_america_civil_war]

# Exercise 4:

# Question: Use the dates from the previous example and store them in an 
# array. Then make your program output the same thing as exercise 3.

movie_array = ["2001", "2004", "2005", "2016"]

puts movie_array[0]
puts movie_array[1]
puts movie_array[2]
puts movie_array[3]

# Exercise 5:

# Question: Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

# Exercise 6:

# Question: Write a program that calculates the squares of 3 float numbers 
# of your choosing and outputs the result to the screen.

puts 3.5 * 3.5
puts 8.9 * 8.9
puts 6.2 * 6.2

# Exercise 7:

# Question: What does the following error message tell you?

=begin
  SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
    from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
=end

#unexpected  )  was expecting   }  we misplaced the } with a )

