# Classes and Objects Part 2

# class methods -- methods we can call directly on the class itself, without
#                  having to instantiate any objects.

# to create a class method prepend the method name with the reserved word self

# class variables -- @@variable 

class GoodDog
  @@number_of_dogs = 0 # initialized class variable to 0

  def initialize
    @@number_of_dogs += 1 # every time we create an object increments our
  end                     # class variable number_of_dogs by 1

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs

#__________________

# Constants -- variable that you never want to change (uses all CAPS)

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end
end
   
sparky = GoodDog.new("Sparky", 4)
puts sparky.age

# self:

# 1. self for calling setter methods from within the class. self was necessary in 
#    order for Ruby to disambiguate between initializing a local variable and 
#    calling a setter method.

# 2. self for class method definitions. 

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self

# self, inside of an instance method, references the instance (object) that 
# called the method - the calling object. Therefore, self.weight= is the 
# same as sparky.weight=, in our example.

# self, outside of an instance method, references the class and can be 
# used to define class methods. Therefore, def self.name=(n) is the same as 
# def GoodDog.name=(n), in our example.

# Exercises:

# Exercise 1:

class MyCar
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

MyCar.gas_mileage(13, 351)

# Exercise 2:

class MyCar
  def to_s
    "hello world"
  end
end

sparky = MyCar.new

puts sparky

# Exercise 3:

# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"

# you get an error undefined method why? and how do we fix it?

# attr_reader :name makes the instance variable only a getter method.
# bob.name is trying to set the :name variable, but can't only have
# getter privlages no setter.




















