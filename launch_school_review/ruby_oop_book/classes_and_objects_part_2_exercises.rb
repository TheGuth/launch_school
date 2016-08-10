# Exercise 1.

# Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  attr_accessor :color, :model, :current_speed
  attr_reader :year

  def initialize(c, m, y)
    self.color = c
    self.model = m
    self.year = y
  end

  def self.gas_mileage(gallons, miles)
    puts "#{gallons/miles} miles per gallon"
  end

  def to_s
    "your car is a #{self.color}, #{self.year}, #{model}"
  end
end

# Exercise 2. 

# Override the to_s method to create a user friendly print out of your object.

# Exercise 3. 

# When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
# We get the following error...

# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
# Why do we get this error and how to we fix it?

# :name only has read prileages and doesn't have a setter method only a getter method.
# can be fixed by changing attr_reader to attr_accessor