# Ruby flow_control_exercises.rb 

# Exercise 1:

# Question: Write down whether the following expressions return true or false.
# Then type the expressions into irb to see the results.

=begin 
1. (32 * 4) >= 129    # false
2. false != !true     # false
3. true == 4          # false
4. false == (847 == '874')   #true
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false    # true
=end

# Exercise 2:

# Question: Write a method that takes a string as argument. 
# The method should return the all-caps version of the string, 
# only if the string is longer than 10 characters. Example: 
# change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a 
# few methods that would be helpful. Check the Ruby Docs!)

def capitalize(string)
  if string.length > 10
    puts string.upcase
  else
    puts string
  end
end

capitalize("hello")
capitalize("hello world")

# Exercise 3:

# Question: Write a program that takes a number from the user 
# between 0 and 100 and reports back whether the number is 
# between 0 and 50, 51 and 100, or above 100.

puts "Pick a number between 0 and 100"
number = gets.chomp
if number.to_i < 0
  puts "Your number #{number} is negative!!"
elsif number.to_i <= 50
  puts "Your number #{number} is between 0 and 50"
elsif number.to_i <= 100
  puts "Your number #{number} is between 51 and 100"
else
  puts "Your number #{number} is above 100"
end

# Exercise 4:

# Question: What will each block of code below print to the screen? 
# Write your answer on a piece of paper or in a text editor and then run 
# each block of code to see if you were correct.

=begin 
1. '4' == 4 ? puts("TRUE") : puts("FALSE")

2. x = 2
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?"
   else
     puts "Did you?"
   end

3. y = 9
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
=end

# block of code 1: puts("FALSE")

# block of code 2: puts "Did you get it right?"

# block of code 3: puts "Alright now!"

# Exercise 5:

# Question: Rewrite your program from exercise 3 using a case statement. 
# Wrap the statement from exercise 3 in a method and wrap this new case 
# statement in a method. Make sure they both still work.

puts "Pick a number between 0 and 100"
number = gets.chomp.to_i

if number < 0
  puts "Your number #{number} is negative!!"
elsif number <= 50
  puts "Your number #{number} is between 0 and 50"
elsif number <= 100
  puts "Your number #{number} is between 51 and 100"
else
  puts "Your number #{number} is above 100"
end


def pick_a_number(number)
  if number < 0
    puts "Your number #{number} is negative!!"
  elsif number<= 50
    puts "Your number #{number} is between 0 and 50"
  elsif number <= 100
    puts "Your number #{number} is between 51 and 100"
  else
   puts "Your number #{number} is above 100"
  end
end

def case_pick_a_number(number)
  case
  when number < 0
    puts "#{number} is negative!!"
  when number < 51
    puts "#{number} is between 0 and 50"
  when number < 101
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end

pick_a_number(5)
pick_a_number(58)
pick_a_number(-3)
pick_a_number(138)

case_pick_a_number(5)
case_pick_a_number(58)
case_pick_a_number(-3)
case_pick_a_number(138)

# Exercise 6:

# Question: When you run the following code...

=begin 
    def equal_to_four(x)
      if x == 4
        puts "yup"
      else
        puts "nope"
    end

    equal_to_four(5)
=end
    # You get the following error message..

# test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end

# Why do you get this error and how can you fix it?

# A end is missing for the if statement

def equal_to_four(x)
      if x == 4
        puts "yup"
      else
        puts "nope"

      end
end
    equal_to_four(5)
















