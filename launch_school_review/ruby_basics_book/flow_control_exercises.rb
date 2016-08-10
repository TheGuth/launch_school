# Flow Control Exercises

require 'pry'

# Exercise 1. Write down whether the following expressions return true or false. 
# Then type the expressions into irb to see the results.

(32 * 4) >= 129                            # false
false != !true                             # false
true == 4                                  # false
false == (847 == '874')                    # true
(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # true

# Exercise 2. Write a method that takes a string as argument. 
# The method should return the all-caps version of the string, only if the string
# is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". 
# (Hint: Ruby's String class has a few methods that would be helpful. 
# Check the Ruby Docs!)

def yelling(string)
  if string.length > 10
    puts string.upcase
  else
    puts string
  end
end

yelling('hello world')
yelling('hello')

# Exercise 3. Write a program that takes a number from the user between 0 and 100 
# and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Pick a number between 0 and 100"
number = gets.chomp.to_i

if number > 100
  puts "Your number #{number} is above 100"
elsif number > 51
  puts "Your number #{number} is between 51 and 100"
elsif number < 0
  puts "You can't pick a negative number"
else
  puts "Your number #{number} is between 0 and 50"
end

# Exercise 4. What will each block of code below print to the screen? 
# Write your answer on a piece of paper or in a text editor and then run each block
# of code to see if you were correct.

'4' == 4 ? puts("TRUE") : puts("FALSE") # "FALSE"

 x = 2
 if ((x * 3) / 2) == (4 + 4 - x - 3)
   puts "Did you get it right?"
 else
   puts "Did you?"
 end

# "Did you get it right?"

 y = 9
 x = 10
 if (x + 1) <= (y)
   puts "Alright."
 elsif (x + 1) >= (y)
   puts "Alright now!"
 elsif (y + 1) == x
   puts "ALRIGHT NOW!"
 else
   puts "Alrighty!"
 end

# "Alright now!"

# Exercise 5. Rewrite your program from exercise 3 using a case statement. 
# Wrap the statement from exercise 3 in a method and wrap this new case statement 
# in a method. Make sure they both still work.

puts "Pick a number between 0 and 100"
number = gets.chomp.to_i

def pick_a_number(number)
  case
  when number < 0
    puts "You can't pick a negative number"
  when number > 100
    puts "Your number #{number} is above 100"
  when number > 51
    puts "Your number #{number} is between 51 and 100"
  when number >= 0
    puts "Your number #{number} is between 0 and 50"
  end
end

pick_a_number(number)

# def pick_a_number_2(number)
#   if number > 100
#     puts "Your number #{number} is above 100"
#   elsif number > 51
#     puts "Your number #{number} is between 51 and 100"
#   elsif number < 0
#     puts "You can't pick a negative number"
#   else
#     puts "Your number #{number} is between 0 and 50"
#   end
# end

# pick_a_number_2(number)

# Exercise 6. When you run the following code...

#     def equal_to_four(x)
#       if x == 4
#         puts "yup"
#       else
#         puts "nope"
#     end

#     equal_to_four(5)
# You get the following error message..

# test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end
# Why do you get this error and how can you fix it?

# We are missing a keyword end for our if else statement.


