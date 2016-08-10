# Exercises Easy 2

# Question 1. In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".

# Bonus: What are two other hash methods that would work just as well for this solution?

p ages.assoc("Spot")
p ages["Spot"]
p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")

# Question 2. Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_ages = 0
ages.each do |k, v|
  total_ages += v
end
p total_ages

# or

ages.values.inject(:+)

# Question 3. In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

ages.delete_if { |_, v| v >= 100 }

p ages

# or 

ages.keep_if { |_, age| age < 100 }

# Question 4. Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original 
# munsters_description above):

"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

p munsters_description.capitalize
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase

# Question 5. We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge(additional_ages)

# Question 6. Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum_age = 0
ages.values.each do |value|
  if value > minimum_age
    minimum_age = value
  end
end

p minimum_age

# or 

ages.values.min

# Question 7. See if the name "dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.match("dino")

# Question 8. In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

p flintstones.index { |name| name[0, 2] == "Be" }


# Question 9. Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end

# Question 10. Again, shorten each of these names to just 3 characters -- 
# but this time do it all on one line:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0,3] }



















