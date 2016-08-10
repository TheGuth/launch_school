# The basics Exercises

# Exercise 1. Add two strings together that, when concatenated, return your first and 
# last name as your full name in one string.

"James " + "Guthrie"

# Exercise 2. Use the modulo operator, division, or a combination of both to 
# take a 4 digit number and find the digit in the:
# 1) thousands place
# 2) hundreds place
# 3) tens place
# 4) ones place

# 9876

9876 / 1000 # returns 9, 1) thousands place
9876 % 1000 / 100 # returns 8, 2) hundreds place
9876 % 100 / 10 # returns 7, 3) tens place
9876 % 10 # returns 6, 4) ones place

# Exercise 3. Write a program that uses a hash to store a list of movie titles 
# with the year they came out. Then use the puts command to make your program 
# print out the year of each movie to the screen. 
# The output for your program should look something like this.

# 1975
# 2004
# 2013
# 2001
# 1981

my_movie_hash = {
  'Harry Potter' => 2003,
  'star wars' => 2004,
  'zootopia' => 2016,
  'supersize me' => 2005
}

puts "#{my_movie_hash['Harry Potter']}"
puts my_movie_hash['star wars']

# Exercise 4. Use the dates from the previous example and store them in an array. 
# Then make your program output the same thing as exercise 3.

my_array = [2003, 2004, 2016, 2005]

puts my_array[0]
puts my_array[1]
puts my_array[2]
puts my_array[3]

# Exercise 5. Write a program that outputs the facotrial of the numbes 5, 6, 7, and 8

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

# Exercise 6. Write a program that calculates the squares of 3 float numbers of 
# your choosing and outputs the result to the screen.

puts 4.30 * 4.30
puts 6.13 * 6.13
puts 124.34 * 124.34

# Exercise 7. What does the following error message tell you?

  # SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
  #   from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# there is a syntax error, unexpected ) was expecting }











