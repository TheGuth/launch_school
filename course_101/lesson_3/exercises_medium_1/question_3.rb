#The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# trying to add two different classes a string and integer

puts "the value of 40 + 2 is " + (40 + 2).to_s

# or

puts "the value of 40 + 2 is #{40 + 2}"