# The Object Model

# Encapsulation --hiding pieces of functionality and making it unavailable 
#                 to the rest of the code base. 

# 1. form of data protection
# 2. data cannot be manipulated or changed without ovbious intention.
# 3. defines boundaries
# 4. allows new levels of complexity.
# This is acomplished through the creation of objects, and using methos to 
# interact with those objects

# Polymorphism --ability for data to be represented as many different types. 

# inheritance -- class inherits behaviors from another class

# class - mold for objects defines what objects have and are defines the 
#         attributes and behaviors of its objects.

# Superclass - basic classes, with large reusability

# subclasses - more fine-grained detailed behaviors.

# module - containes shared behaviors that can be mixin to a class. The class
# uses the keyword include module, and then has access to those behaviors.

# classes are basic outlines of what an object should be made of, and what it 
# should be able to do.

# good_dog.rb

class GoodDog # defines a new class as GoodDog, which is our outline for
end           # GoodDog objects. 

sparky = GoodDog.new # creates a instance of GooDog class
#                      and stores it in the variable sparky
#                      from the GoodDog class

# instantiation -- creating a new object or instance from a class

# module -- is a collection of behaviors that is useable in other classies
#           via mixins. aka a module is mixed in to a class using the reserve
#           word include.

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

Sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors

# Exercises

# exercise 1:

class Programmer
  include Code
end

james = Programmer.new

# exercise 2:

module Code
  def coding(lines)
    puts "#{lines}"
  end
end

class Programmer
  include Code
end

james.coding('hello')






