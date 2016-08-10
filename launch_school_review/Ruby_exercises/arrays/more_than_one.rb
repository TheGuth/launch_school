# More Than One

# In the code below, an array containing different types of pets is assigned to pets.

pets = ['cat', 'dog', 'fish', 'lizard']

# Select 'fish' and 'lizard' from pets at the same time, assign the return value
# to a variable named my_pets, then print the value of my_pets.

my_pets = []
pets.select do |item|
  if item == 'lizard' || item == 'fish'
    my_pets << item
  end
end

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# or

my_pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# Expected output:

# I have a pet fish and a pet lizard!
