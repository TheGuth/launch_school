# Loops and Iterators Exercises

# Exercise 1. What does the each method in the following program return after it 
# is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# returns [1, 2, 3, 4, 5]

# Exercise 2. Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". Each loop can get info from the user.

user_response = nil
while user_response != 'stop'
  puts "what would you like me to do?"
  user_response = gets.chomp
end

# Exercise 3. Use the each_with_index method to iterate through an array of your 
# creation that prints each index and value of the array.

my_array = [1, 2, 3, 4, 5, 6]

my_array.each_with_index do |v, idx|
  puts "#{v + 1}: #{idx}"
end

# books response 

top_five_games = ["mario brothers",
                  "excite bike",
                  "ring king",
                  "castlevania",
                  "double dragon"]

top_five_games.each_with_index do | game, index |
  puts "#{index + 1}. #{game}"
end

# Exercise 4. Write a method that counts down to zero using recursion.

def countdown_recursive(number)
  if number > 0
    puts number
    countdown_recursive(number-1)
  end
end

countdown_recursive(10)

# Books answer

def count_to_zero(number)
  if number <= 0
    puts number
  else
    puts number
    count_to_zero(number-1)
  end
end

count_to_zero(10)
count_to_zero(20)
count_to_zero(-3)
