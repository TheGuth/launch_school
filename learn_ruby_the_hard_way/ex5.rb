# ex5.rb 

name = 'James R. Guthrie'
age = 24 # not a lie in 2015
height = 75 # inches
weight = 220 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Blonde'
centimeters_per_inch = 2.54
pounds_in_kilometers = 2.20

height_centimeters = height * centimeters_per_inch
weight_kilometers = weight * pounds_in_kilometers

puts "Let's talk about #{name}."
puts "He's #{height} inches tall."
puts "he's #{weight} pounds heavy."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffee."

# this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height}, and #{weight} I get #{age + height + weight}."
puts "My height in centimeters is #{height_centimeters}"
puts "My weight in kilometers is #{weight_kilometers}"