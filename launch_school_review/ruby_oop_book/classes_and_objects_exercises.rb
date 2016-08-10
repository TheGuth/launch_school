# Exercise 1.

# Create a class called MyCar. When you initialize a new instance or object of the 
# class, allow the user to define some instance variables that tell us the year, color, 
# and model of the car. Create an instance variable that is set to 0 during 
# instantiation of the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :color, :model, :current_speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up
    self.current_speed += 20
    puts "pressing the gas to speed up to #{self.current_speed}"
  end

  def brake
    self.current_speed -= 20
    puts "pressing the brake to slow down to #{self.current_speed}"
  end

  def shut_car_off
    self.current_speed = 0
    puts "parked the car and turned the engine off."
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car is now #{self.color}"
  end
end

my_car = MyCar.new('2013', 'silver', 'Ford')
my_car.speed_up
my_car.brake
my_car.shut_car_off
puts my_car.year
puts my_car.color
puts my_car.model
puts my_car.current_speed

# Exercise 2. 

# Add an accessor method to your MyCar class to change and view the color of your car.
# Then add an accessor method that allows you to view, but not modify, the year of 
# your car.

puts my_car.color = 'black'
puts my_car.color

# Exercise 3.

# You want to create a nice interface that allows you to accurately describe the 
# action you want your program to perform. Create a method called spray_paint that 
# can be called on an object and will modify the color of the car.

my_car.spray_paint('blue')
puts my_car.color







