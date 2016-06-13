# Build a program that asks a user for the length and width of a room 
# in meters and then displays the area the of the room in both square meters 
# and square feet.

# Note: 1 square yard == 10.7639 square feet

#Do not worry about validating the input at this time.

# Example 

# Enter the length of the room in meters: 
# 10
# Enter the width of the room in meters: 
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQMETERS_TO_SQFEET = 10.7639

puts "Please enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Please enter the width of the room in meters:"
width = gets.chomp.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} square meters, or (#{square_feet} square feet)."

puts "Please enter the length of the room in feet:"
new_length = gets.chomp.to_f

puts "Please enter the width of the room in feet:"
new_width = gets.chomp.to_f

square_feet_2 = (new_length * new_width).round(2)
square_inches = (square_feet_2 * 12).round(2)
square_centimeters = (square_inches * 2.54).round(2)

puts "the are of the room would be #{square_feet_2} square feet. or #{square_inches} in square inches. " + \
     "Or #{square_centimeters} in square centimeters."