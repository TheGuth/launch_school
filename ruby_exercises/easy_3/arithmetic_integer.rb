# Write a program that prompts the user for two positive integers, and 
# then prints the results of the following operations on those two numbers: 
# addition, subtraction, product, quotient, remainder, and power. 
# Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

puts "Enter the first number: "
number_1 = gets.chomp

puts "Enter the second number: "
number_2 = gets.chomp

 answer_1 = number_1 + number_2
 puts "#{number_1} + #{number_2} = #{answer_1}"

 answer_2 = number_1.to_i - number_2.to_i
 puts "#{number_1} - #{number_2} = #{answer_2}"

 answer_3 = number_1.to_i * number_2.to_i
 puts "#{number_1} * #{number_2} = #{answer_3}"

 answer_4 = number_1.to_f / number_2.to_f
 puts "#{number_1} / #{number_2} = #{answer_4}"

 answer_5 = number_1.to_i % number_2.to_i
 puts "#{number_1} % #{number_2} = #{answer_5}"

 answer_6 = number_1.to_i ** number_2.to_i
 puts "#{number_1} ** #{number_2} = #{answer_6}"

# _____________________________________

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number:")
first_number = gets.chomp.to_i
prompt("Enter the second number:")
second_number = gets.chomp.to_i

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number**second_number}")
