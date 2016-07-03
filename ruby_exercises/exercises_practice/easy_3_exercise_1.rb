# Write a program that solicits 6 numbers from the user, then prints a
# message that describes whether or not the 6th number appears amongs the 
# first 5 numbers

def prompt(msg)
  puts "=> #{msg}"
end

my_numbers = []

prompt("Enter the 1st number:")
my_numbers << gets.chomp

prompt("Enter the 2nd number:")
my_numbers << gets.chomp

prompt("Enter the 3rd number:")
my_numbers << gets.chomp

prompt("Enter the 4th number:")
my_numbers << gets.chomp

prompt("Enter the 5th number:")
my_numbers << gets.chomp

prompt("Enter the 6th number:")
number_6 = gets.chomp

if my_numbers.include?(number_6)
  prompt("The #{number_6} appears in #{my_numbers}")
else
  prompt("The #{number_6} does not appear in #{my_numbers}")
end