# Ruby intro_exercises

# Exercise 1:

# Question: Use the each method of Array to iterate over 
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each do |item|
  puts "#{item}"
end

# Exercise 2:

# Question: Same as above, but only print out values greater than 5.

arr.each do |item|
  if item > 5
    puts "#{item}"
  end
end

# Exercise 3:

# Question: Now, using the same array from #2, use the select method to 
# extract all odd numbers into a new array.

arr.select do |num| 
  if num.odd?
    puts num
  end
end

# other way to do this problem

new_arr = arr.select { |num| num % 2 != 0}

puts new_arr

# Exercise 4:

# Question: Append "11" to the end of the original array. Prepend "0" to 
# the beginning.
puts "______________"
arr.push(11) #append or add to the end
arr.unshift(3) #Prepend or add to the beggining

puts arr

# Exercise 5:

# Question: Get rid of "11". And append a "3".

arr.pop()
arr.push(3)

puts arr

# Exercise 6:

# Question: Get rid of duplicates without specifically removing any one value.
puts "______________"
new_arr = arr.uniq
puts new_arr

# Exercise 7:

# Question: What's the major difference between an Array and a Hash?

# arrays are an ordered list
# Hashes contain key: value pairs that you can use as reference

# Exercise 8: 

# Question: Create a Hash using both Ruby syntax styles.

rocket_syntax = {
  'jim' => 23,
  'Bob' => 22,
  'Carl' => 27,
  :jimmy => 28
}

symbol_syntax = {
  Jim: 23,
  Bob: 22,
  Carl: 27
}

puts rocket_syntax # old version
puts symbol_syntax # new version

# Exercise 9:

# Question: Suppose you have a hash h = {a:1, b:2, c:3, d:4}

=begin
 Get the value of key `:b`.

2. Add to this hash the key:value pair `{e:5}`

3. Remove all key:value pairs whose value is less than 3.5
Solution
=end

h = {a:1, b:2, c:3, d:4}

puts h[:a]
h[:e] = 5 # add new key value pair :e => 5
puts h

h = {a:1, b:2, c:3, d:4}

h.each do |k, v|
  if v > 3.5
    puts "#{k}: #{v}"
  end
end

# Exercise 10:

# Question: Can hash values be arrays? Can you have an array of hashes? (give examples)

# yes

hash_1 = {
  a: [1, 2],
  b: [3, 4],
  c: [5, 6]
}

array_1 = [{a: 1, b: 2}, {c: 3, d: 4}]

puts hash_1
puts array_1

# Exercise 11:

# Question: Look at several Rails/Ruby online API sources and say which 
# one you like best and why.

# SASS, tweetstream, google_calendar, contacts, Brakeman, RSpec, Active Admin

# Exercise 12:

# Question: Given the following data structures. Write a program that moves 
# the information from the array into the empty hash that applies to the 
# correct person.


contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

=begin
contact_data.each do |item|
  if contacts.has_key = "Joe Smith"
    contacts["JoeSmith"] = item[0]
  else
=end

# launch school answer:

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

# Exercise 13:

# Question: Using the hash you created from the previous exercise, 
# demonstrate how you would access Joe's email and Sally's phone number?

puts contacts["Joe Smith"][:phone]
puts contacts["Sally Johnson"][:phone]

# Exercise 14: 

# Question: In exercise 12, we manually set the contacts hash values one by 
# one. Now, programmatically loop or iterate over the contacts hash from 
# exercise 12, and populate the associated data from the contact_data array. 
# Hint: you will probably need to iterate over 
# ([:email, :address, :phone]), and some helpful methods might be the 
# Array shift and first methods.

# Note that this exercise is only concerned with dealing with 1 entry in 
# the contacts hash, like this:

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
# As a bonus, see if you can figure out how to make it work with multiple entries in the contacts hash.
field = [:email, :address, :phone]

contacts.each do |name, hash|
  field.each do |field|
    hash[field] = contact_data.shift
  end
end

puts contacts

# this is made for multiple contacts
=begin
contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end
=end

# Exercise 15:

# Question: Use Ruby's Array method delete_if and String method start_with? 
# to delete all of the words that begin with an "s" in the following array.

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# Then recreate the arr and get rid of all of the words that start with "s" 
# or starts with "w".

arr.delete_if do |item|
  item.start_with?("s")
end

puts arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if do |item| 
  item.start_with?("s", "w")
end

puts arr

# Exercise 16:

# Question: Take the following array:

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

# and turn it into a new array that consists of strings containing one word. 
# (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using 
# Array's map and flatten methods, as well as String's split method.

a = a.map do |item|
  item.split
end
a = a.flatten
p a

# Exercise 17:

# Question: What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# Output "These hashes are the same!"
















