# New Pet

# In the code below, an array containing different types of pets is assigned to pets.

pets = ['cat', 'dog', 'fish', 'lizard']

# Select 'fish' from pets, assign the return value to a variable named my_pet, 
# then print the value of my_pet.

pets.select do |item| 
  if item == 'fish'
    puts "I have a pet #{item}!"
  end
end

# or

my_pet = pets[2]

puts "I have a pet #{my_pet}!"


# Expected output:

# I have a pet fish!
