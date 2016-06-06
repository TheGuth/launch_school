# Ruby loops_iterators_exercises.rb 

# Exercise 1:

# Question: What does the each method in the following program return 
# after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# x = [1, 2, 3, 4, 5]  (Because nothing is saved and it returns the initial value)

# Exercise 2:

# Question: Write a while loop that takes input from the user, 
# performs an action, and only stops when the user types "STOP". 
# Each loop can get info from the user.

puts = "Do you want me to stop? then type stop"
input = gets.chomp

while input != "stop" do
  puts "If you want me to stop, type stop!"
  input = gets.chomp
end

# Exercise 3:

# Question: Use the each_with_index method to iterate through an array 
# of your creation that prints each index and value of the array.

my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array.each_with_index { |value, index| puts "#{index + 1}. #{value}" }

# Exercise 4:

# Question: Write a method that counts down to zero using recursion.

def count_down(number)
  puts number
  if number >= 0
    count_down(number - 1)
  else
    puts "#{number} is negative"
  end
end

count_down(10)
count_down(-2)
count_down(100)
