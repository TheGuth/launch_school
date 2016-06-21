# Build a program that asks a user for the length and width of a room in meters and 
# then displays the area the of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

puts "Enter the length of the room in meters: "
length = gets.chomp.to_i
puts "Enter the width of the room in meters: "
width = gets.chomp.to_i

def square_meters(length, width)
  sq_meters = (length * width)
end

def sq_feet_conversion(sq_meters)
  conversion = sq_meters * 10.7639
end

meters = square_meters(length, width)
feet = sq_feet_conversion(square_meters(length, width))

p "The area of the room is #{meters} or (#{feet})"
