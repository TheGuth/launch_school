# Hashes Exercises

# Exercise 1. Given a hash of family members, with keys as the title and an 
# array of names as the values, use Ruby's built-in select method to gather 
# only immediate family members' names into a new array.

# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = []

family.select do |k, v|
  if k == :brothers || k == :sisters
    immediate_family << v
    immediate_family.flatten!
  end
end

p immediate_family

# Exercise 2. Look at Ruby's merge method. Notice that it has two versions. 
# What is the difference between merge and merge!? 
# Write a program that uses both and illustrate the differences.

cat = {name: "whiskers"}
weight = {weight: "10 lbs"}
puts cat.merge(weight)
puts cat                  # => {:name=>"whiskers"}
puts weight               # => {:weight=>"10 lbs"}
puts cat.merge!(weight)
puts cat                  # => {:name=>"whiskers", :weight=>"10 lbs"}
puts weight               # => {:weight=>"10 lbs"}

# Exercise 3. Using some of Ruby's built-in Hash methods, 
# write a program that loops through a hash and prints all of the keys. 
# Then write a program that does the same thing except printing the values. 
# Finally, write a program that prints both.

family.each do |k, _|
  puts k
end

family.each do |_, v|
  puts v
end

family.each do |k, v|
  puts "#{k}: #{v}"
end

# Exercise 4. Given the following expression, how would you access the name of the 
# person?

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts person[:name]

# Exercise 5. What method could you use to find out if a Hash contains a 
# specific value in it? Write a program to demonstrate this use.

puts family.has_value?("bob")

# Exercise 6. Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in a different order. 
# Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]


def rearrange(string)
  string.chars.sort!.join
end

def anagrams(array)
  anagram_array = []
  array.each do |item|
    rearranged_item = rearrange(item)
    anagram_array << rearranged_item unless anagram_array.include?(rearranged_item)
  end
  p anagram_array
end

anagrams(words) # produces array of keys.

# book answer

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each do |k, v|
  puts "------"
  p v
end

p result s

# Exercise 7. Given the following code...

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# What's the difference between the two hashes that were created?

# my_hash is created using a symbol method. 
# my_hash2 is created using the rocket method.

# Exercise 8. If you see this error, what do you suspect is the most likely problem?

# NoMethodError: undefined method `keys' for Array

# A. We're missing keys in an array variable.

# B. There is no method called keys for Array objects.

# C. keys is an Array object, but it hasn't been defined yet.

# D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.

# answer is B.
