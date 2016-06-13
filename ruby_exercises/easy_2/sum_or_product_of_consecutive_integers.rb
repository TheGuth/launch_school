# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all numbers 
# between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

puts "Please enter an integer greater than 0: "
number = gets.chomp.to_i

puts "Enter 's' to compute the sum of all numbers 1 to #{number}, 'p' to compute the product of all numbers 1 to #{number}."
choice = gets.chomp.to_s

if choice.downcase == 's'
  final_number = 1
  1.upto(number) do |x|
    final_number = final_number + x
  end
    puts "The sum of the integers between 1 and #{number} is #{final_number}"
elsif choice.downcase == 'p'
  final_number = 1
  1.upto(number) do |x|
    final_number = final_number * x
  end
    puts "The product of the integers between 1 and #{number} is #{final_number}"
else
  puts "seems like you didn't input the correct choice."
end

# _________________________________________________________________________


puts "Please enter an integer greater than 0: "
number = gets.chomp.to_i

puts "Enter 's' to compute the sum of all numbers 1 to #{number}, 'p' to compute the product of all numbers 1 to #{number}."
choice = gets.chomp.to_s

if choice.downcase == 's'
  final_number = 1.upto(number).inject { |sum, n| sum + n }
  puts "The sum of the integers between 1 and #{number} is #{final_number}"
elsif choice.downcase == 'p'
  final_number = 1.upto(number).inject { |product, n| product * n }
  puts "The product of the integers between 1 and #{number} is #{final_number}"
else
  puts "seems like you didn't input the correct choice."
end

# ___________________________________________________________________

def sum(num)
  total = 0
  1.upto(num).each { |value| total += value }
  total
end

def product(num)
  total = 1
  1.upto(num).each { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end


1.upto(number).inject { |sum, n| sum + n }
1.upto(number).inject { |product, n| product * n }


