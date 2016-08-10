# Inheritance and Variable Scope

# Instance Variables:

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

#______________________

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name  

# ____________________________

module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim

# would need to do this

teddy = Dog.new
teddy.enable_swimming
teddy.swim

# Class Variables

class Animal
  @@total_animals = 0

  def initialize
    @@total_animals += 1
  end
end

class Dog < Animal
  def total_animals
    @@total_animals
  end
end

spike = Dog.new
spike.total_animals

# ______________________

class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels     # 4

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels  # 2
Vehicle.wheels     # 2

# Constants

class Dog
  LEGS = 4
end

class Cat
  def legs
    LEGS
  end
end

kitty = Cat.new
kitty.legs   # error unititialized constant

# ___________________________

class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS # :: is called namespacing
  end
end

kitty = Cat.new
kitty.legs   # 4

# __________________________

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  def self.wheels
    WHEELS
  end

  def wheels
    WHEELS
  end
end

car.wheels # 4

# ____________________

a_car = Car.new
a_car.wheels # 4

module Maintenace
  def Change_tires
    "Changing #{WHEELS} tires."
  end
end

# two ways to fix the module WHEELS error

# 1.
module Maintenance
  def change_tires
    "Changing #{Vehicle::WHEELS} tires."
  end
end

# 2.
module Maintenance
  def change_tires
    "Changing #{Car::WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires #name error unitiaialized constanct WHEELS

# Summary

# Instance Variables: behave the way we'd expect. The only thing to watch out for is
# to make sure the instance variable is initialized before referencing it.

# Class Variables: have a very insidious behavior of allowing sub-classes to
# override super-class class variables. Further, the change will affect all other
# sub-classes of the super_class. This is extremely unintuitive behavior, forcing 
# some Rubyists to eschew using class variables altogether.

# Constants: have lexical scope which makes their scope resolution rules very unique
# compared to other variable types. If Ruby doesn't find the constant using lexical
# scope, it'll then look at the inheritance heirarchy. 























