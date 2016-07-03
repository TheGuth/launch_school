# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.
# Do not worry about validating the input.

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Enter the first number:")
number_1 = gets.chomp.to_i

prompt("Enter the second number:")
number_2 = gets.chomp.to_i

p number_1 + number_2
p number_1 - number_2
p number_1 * number_2
p number_1 / number_2.to_f
p number_1 % number_2
p number_1 ** number_2