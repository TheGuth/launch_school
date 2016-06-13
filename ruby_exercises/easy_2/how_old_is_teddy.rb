# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200.

# example: teddy is 69 years old!

age = rand(20..200)

puts "Please enter your name"
answer = gets.chomp

if answer == ''
  answer = 'Teddy'
end

puts "#{answer} is #{age} years old!"