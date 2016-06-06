# Ruby arrays_exercises.rb 

# Exercise 1:

# Question: Below we have given you an array and a number. Write a program 
# that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number)
  puts "Yay the number is in the array"
else
  puts "oopse that number isn't in the array"
end

puts arr.include?(3) # true

arr.each do |num|
  if num == number
    puts "#{number} is in the array."
  else
    puts "#{number} is not in the array"
  end
end

# Exercise 2:

# Question: What will the following programs return? 
# What is value of arr after each?

arr = ["b", "a"]
arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)

# Program 1: returns 1
# arr = [["b"], ["b, 2"], ["b, 3"], ["a", 1], ["a", 2], ["a", 3]]

# Program 2: returns [1, 2, 3]
# arr = [["b"], ["a", [1, 2, 3]]]

# Exercise 3:

# Question: How do you print the word "example" from the following array?

arr = [["test", "hello", "world"], ["example", "mem"]]
arr.last[0]  # or arr.last.first

# Exercise 4:

# Question: What does each method return in the following example?

arr = [15, 7, 18, 5, 12, 8, 5, 1]

arr.index(5)   # gives 5 position in the array which is 3

arr.index[5]   # error undefined method wasn't expecting []

arr[5]         # gives 8

# Exercise 5:

# Question: What is the value of a, b, and c in the following program?

string = "Welcome to America!"
a = string[6]  # a = e
b = string[11] # b = A
c = string[19] # c = nil

# Exercise 6:

# Question: You run the following code...

names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'

# ...and get the following error message:

TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>''

# What is the problem and how can it be fixed?

# names['margaret'] is trying to index which requires an integer not a string
# names[3] = 'jody' would solve the problem.

# Exercise 7:

# Question: Write a program that iterates over an array and builds a 
# new array that is the result of incrementing each value in the original 
# array by a value of 2. You should have two arrays at the end of this 
# program, The original array and the new array you've created. 
# Print both arrays to the screen using the p method instead of puts.

my_arr = [1, 2, 3, 4, 5]
new_arr = []

my_arr.map { |x| new_arr.push(x + 2) }

p my_arr
p new_arr

#arr.each do |n|
#  new_arr << n + 2    # example solution 
#end














