# In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
# We could have used either Array#concat or Array#push to add Dino to the family.
flintstones.push('Dino')
flintstones.unshift('Dino')
# How can we add multiple items to our array? (Dino and Hoppy)

flintstones.insert(0, 'Dino', 'Hoppy')

puts flintstones

# or flinstones.push('Dino').push('hoppy')