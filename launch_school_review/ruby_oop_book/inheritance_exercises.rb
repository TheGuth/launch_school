# Exercise 1. 

# Create a superclass called Vehicle for your MyCar class to inherit from and move the 
# behavior that isn't specific to the MyCar class to the superclass. Create a constant 
# in your MyCar class that stores information about the vehicle that makes it different
#  from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also 
# has a constant defined that separates it from the MyCar class in some way.

class Vehicle
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class My_Car > Vehicle
  NUMBER_OF_DOORS = 4
  TOWABLE = false
end

class My_Truck > Vehicle
  NUMBER_OF_DOORS = 2
  TOWABLE = true
end

# Exercise 2. 

# Add a class variable to your superclass that can keep track of the number of 
# objects created that inherit from the superclass. Create a method to print out 
# the value of this class variable as well.

class Vehicle
  @@number_of_vehicles = 0

  def iniitialize
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class My_Car > Vehicle
  NUMBER_OF_DOORS = 4
  TOWABLE = false
end

class My_Truck > Vehicle
  NUMBER_OF_DOORS = 2
  TOWABLE = true
end

# Exercise 3.

# Create a module that you can mix in to ONE of your subclasses that describes a
# behavior unique to that subclass.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

# Exercise 4.

# Print to the screen your method lookup for the classes that you have created.

puts My_Car.ancestors
puts My_Truck.ancestors
puts Vehicle.ancestors

# Exercise 5. 

# Move all of the methods from the MyCar class that also pertain to the MyTruck class 
# into the Vehicle class. Make sure that all of your previous method calls are 
# working when you are finished.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "You new #{color} paint job looks great!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

# Exericse 6.

# Write a method called age that calls a private method to calculate the age of the
# vehicle. Make sure the private method is not available from outside of the class. 
# You'll need to use Ruby's built-in Time class to help.

class Vehicle
  # code omitted for brevity...
  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

# code omitted for brevity...

puts lumina.age   #=> "Your chevy lumina is 17 years old"

# Exercise 7. 

# Create a class 'Student' with attributes name and grade. Do NOT make the grade 
# getter public, so joe.grade will raise an error. Create a better_grade_than? 
# method, that you can call like so...

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)

# Exercise 8. 

# Given the following code...

bob = Person.new
bob.hi
# And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
# What is the problem and how would you go about fixing it?

# the method hi is private which means we don't have access to it.





