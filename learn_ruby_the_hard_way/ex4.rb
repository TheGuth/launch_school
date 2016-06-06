# ex4.rb 


cars = 100
# cars is pointed to integer 100
space_in_a_car = 4.0
# space_in_a_car is pointed to float 4.0
drivers = 30
# drivers is pointed to integer 30
passengers = 90
# passengers is pointed to integer 90
cars_not_driven = cars - drivers
# cars_not_driven is pointed to cars (100) - drivers(30)
# cars_not_driven = 70
cars_driven = drivers
#cars_driven points to drivers (30)
carpool_capacity = cars_driven * space_in_a_car
# carpool_capacity points to cars_drive (30) * space_in_a_car (4.0)
# carpool_capacity points to (120.0)
average_passengers_per_car = passengers / cars_driven
# average_passengers_per_car points to passengers (90) / cars_driven (30)
# average_passengers_per_car points to (3)
puts "There are #{cars} cars available." 
# puts "There are 100 cars available."
puts "There are only #{drivers} drivers available."
#puts "There are only 30 drivers available."
puts "There will be #{cars_not_driven} empty cars today."
# puts "There will be 70 empty cars today."
puts "We can transport #{carpool_capacity} people today."
# puts "We can transport 120 people today."
puts "We have #{passengers} to carpool today."
# puts "We have 90 to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."
# puts "We need to put about 3 in each car."