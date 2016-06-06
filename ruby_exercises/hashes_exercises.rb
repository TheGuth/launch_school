# Ruby hashes_exercises.rb 

# Exercise 1:

# Question: Given a hash of family members, with keys as the title and an array
# of names as the values, use Ruby's built-in select method to gather only 
# immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select { |k,v| (k == :sisters) || (k == :brothers) }

p immediate_family

arr = immediate_family.values.flatten

p arr

# Exercise 2: 

# Question: Look at Ruby's merge method. Notice that it has two versions. 
# What is the difference between merge and merge!? 
# Write a program that uses both and illustrate the differences.

hash_1 = { one: 'one', two: 'two', three: 'three' }
hash_2 = { four: 'four', five: 'five', six: 'six' }

puts hash_1.merge(hash_2) # creates a new hash with hash_1 and hash_2 combined

puts hash_1  # Shows hash_1 and hash_2 are unchanged 
puts hash_2  #

puts hash_1.merge!(hash_2)  # creates a new hash with hash_1 and hash_2 combined
                            # Modifies hash_1 and hash_2

puts hash_1 # hash_1 is modified and now includes hash_2

# Exercise 3:

# Question: Using some of Ruby's built-in Hash methods, write a program 
# that loops through a hash and prints all of the keys. Then write a program 
# that does the same thing except printing the values. Finally, write a 
# program that prints both.

hash_1 = { one: 'hello', two: 'wow', three: 'awesome' }

puts hash_1.keys
puts hash_1.values
#puts hash_1.

hash_1.each { |k,v| puts "#{k}" }  # or opposites.each_key { |key| puts key 
hash_1.each { |k,v| puts "#{v}" }  # or opposites.each_value { |value| puts value }
hash_1.each { |k,v| puts "#{k} and #{v}" } 

# Exercise 4:

# Question: Given the following expression, how would you access the name of the person?

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts person[:name]

# Exercise 5:

# Question: What method could you use to find out if a Hash contains a 
# specific value in it? Write a program to demonstrate this use.

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person.has_value?('Bob') # simplified program gives true or false

if person.has_value?('Bob') # gives options other than ture and false
  puts "he is here"
else
  puts "he isn't here!"
end

# Exercise 6:

# Question: Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in a 
# different order. Your output should look something like this:

anagrams = {}

words.each do |word| 
  key = word.split('').sort.join
  if anagrams.has_key?(key)
    anagrams[key].push(word)
  else 
    anagrams[key] = [word]
  end
end

p anagrams

# Exercise 7:

# Question: Given the following code...

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# What's the difference between the two hashes that were created?

# my_hash is x: is a symbol and represents x: (output is {x: "some value"})
# my_hash is x is "hi there" (output is {"hi there" => "some value"})

# Exercise 8:

# Question: If you see this error, what do you suspect is the most likely problem?

# NoMethodError: undefined method `keys' for Array

=begin
A. We're missing keys in an array variable.

B. There is no method called keys for Array objects.

C. keys is an Array object, but it hasn't been defined yet.

D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.
=end

# B.








