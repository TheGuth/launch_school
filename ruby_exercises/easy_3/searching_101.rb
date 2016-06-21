
# Write a program that solicits 6 numbers from the user, then prints a 
# message that describes whether or not the 6th number appears amongs 
# the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].


number_array = []

puts "Enter the 1st number"
number_1 = gets.chomp.to_i
number_array.push(number_1)

puts "Enter the 2nd number"
number_2 = gets.chomp.to_i
number_array.push(number_2)

puts "Enter the 3rd number"
number_3 = gets.chomp.to_i
number_array.push(number_3)

puts "Enter the 4th number"
number_4 = gets.chomp.to_i
number_array.push(number_4)

puts "Enter the 5th number"
number_5 = gets.chomp.to_i
number_array.push(number_5)

puts "Enter the 6th number"
number_6 = gets.chomp.to_i

if number_array.include?(number_6)
  puts "The number #{number_6} appears in #{number_array}."
else
  puts "The number #{number_6} does not appear in #{number_array}."
end

# _______________________________________________________________

numbers = []

puts "Enter the 1st number:"
numbers << gets.chomp
puts "Enter the 2nd number:"
numbers << gets.chomp
puts "Enter the 3rd number:"
numbers << gets.chomp
puts "Enter the 4th number:"
numbers << gets.chomp
puts "Enter the 5th number:"
numbers << gets.chomp
puts "Enter the last number:"
last_number = gets.chomp

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end

