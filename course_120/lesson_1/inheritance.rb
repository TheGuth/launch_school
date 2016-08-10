# Inheritance.rb 

# Inheritance -- when a class inherits behavior from another class.

# good_dog_class.rb

class Animal 
  def speak # class behavior aka method
    "Hello!"
  end
end

class GoodDog < Animal # we are inheriting from class Animal, and are not able
end                    # to use Animal behaviors in our GoodDog class.

class Cat < Animal # we are inheriting from class Animal, and are not able
end                # to use Animal behaviors in our GoodDog class.

sparky = GoodDog.new # create new object of the GoodDog class
paws = Cat.new # create new object of the Cat class
puts sparky.speak # called the Animal speak method because we inherited it.
puts paws.speak # called the Animal speak method because we inherited it.

# good_dog_class.rb

class Animal
  def speak
    "Hello!"
  end
end

# class GoodDog < Animal
#   attr_accessor :name

#   def initialize(n)
#     self.name = n
#   end

#   def speak
#     "#{self.name} says arf!"
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new("Sparky")
# paws = Cat.new

# puts sparky.speak
# puts paws.speak

# DRY Don't Repeate Yourself.

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
puts sparky.speak

# using super with initialize

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

bruno = GoodDog.new("brown")
p bruno

p BadDog.new(2, "bear")

# _____________________________

module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => I'm swimming!
neemo.swim                  # => I'm swimming!
paws.swim                   # => NoMethodError

# Inheritance vs Modules


# You can only subclass from one class. But you can mix in as many modules as 
# you'd like.

# If it's an "is-a" relationship, choose class inheritance. If it's a 
# "has-a" relationship, choose modules. Example: a dog "is an" animal; 
# a dog "has an" ability to swim.

# You cannot instantiate modules (i.e., no object can be created from a module)
#  Modules are used only for namespacing and grouping common methods together.


# Module Namespacing: organizing similar classes under a module.

module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')
kitty.say_name('kitty')

# Modules as containers: module methods, uses modules to house other methods.

module Mammal
  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)

# public method: a method that is available to anyone who knows either the
#                class name or the object's name. (readily available for 
#                the rest of the program to use)

# private method: a method that is doing work in the class but doesn't need 
#                 to be available to the rest of the program.

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years
    self.age / DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years

# protected method: outside the class, acts like private methods. Inside
#                   the class acts like public methods.

# Exercises

# Exercise 1:

class Vehicle
  def miles_per_gallon(gallons, miles)
    mpg = miles / gallons
    puts "#{mpg} miles per gallon of gas"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

# Exercise 2:

class Business
  @@number_of_employees = 0
end

class employees < Business
  def initialize
    @@number_of_employees += 1
  end
end

tim = employees.new
bob = employees.new

# Exercise 3:

module Convertible
  def Convertible
    "Yay I'm a Convertible"
  end
end

class Vehicle
  def miles_per_gallon(gallons, miles)
    mpg = miles / gallons
    puts "#{mpg} miles per gallon of gas"
  end
end

class MyCar < Vehicle
  include Convertible
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

# Exercise 4:

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

# Exercise 5:

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

# Exercise 6:

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

puts lumina.age   #=> "Your chevy lumina is 17 years

# Exercise 7

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = student.new("Joe", 90)
bob = student.new("Bob", 84)
puts "Well done!" if joew.better_grade_than?(bob)





