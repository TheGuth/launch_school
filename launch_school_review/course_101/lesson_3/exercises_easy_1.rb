# Exercises: Easy 1

# Question 1. What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# outputs
# 1
# 2
# 2
# 3 
# it doesn't mutate the object so it stays the same

# Question 2. Describe the difference between ! and ? in Ruby. 
# And explain what would happen in the following scenarios:

# what is != and where should you use it?
# != is not equal and should be used when comparing two values in a conditional

# put ! before something, like !user_name
# makes it the opposite so if it is truthy it will be false, if it is falsy it will be true

# put ! after something, like words.uniq!
# Means that it will mutate the caller or the object the method is being called on

# put ? before something
# is used as a teritary operator

# put ? after something
# means that it will return a true or false

# put !! before something, like !!user_name
# changes it into it's boolean form.

# Question 3. Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub! 'important', 'urgent'

p advice

# Question 4. The Ruby Array class has several methods for removing items from the 
# array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to the original array 
# between method calls)?

numbers.delete_at(1) # would delete at index 1
numbers.delete(1)    # would delete the number 1.

# Question 5. Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

(10..100).each do |num|
  if num == 42
    puts "Yes 42 is within 10 and 100"
  end
end

p (10..100).cover?(42)

# Question 6. Starting with the string:

famous_words = "seven years ago..."
# how two different ways to put the expected "Four score and " in front of it.

"Four score and " + famous_words

famous_words.prepend("Four score and ")

"Four sore and " << famous_words

# Question 7. Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

#If we take advantage of Ruby's Kernel#eval method to have it execute this string as 
# if it were a "recursive" method call

eval(how_deep)

# what will be the result?

42

# Question 8. If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

p flintstones.flatten

# or

flintstones.flatten!

# Question 9. Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's 
# number

p flintstones.to_a[2]

# or 
p flintstones.assoc("Barney")

# Question 10. Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the 
# positions in the array.

my_hash = {}
flintstones.each_with_index do |item, idx|
  my_hash[item] = idx
end

p my_hash
