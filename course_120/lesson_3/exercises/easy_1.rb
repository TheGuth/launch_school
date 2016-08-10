# Exercises: Easy 1

# Question 1: Which of the following are objects in Ruby? if they are objects, how
#             can you find out what class they belong to?

# They are all objects. Everything in Ruby is an Object.
true
"hello"
[1, 2, 3, "happy days"]
142

# you can use .class method to tell us what type of object we are looking at

# Question 2: If we have a Car class and a Truck class and we want to be able
# to go_fast, how can we add the ability for them to go_fast using the 
# module Speed. How can you check if your car or truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow"
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

p Truck.new.go_fast
p Car.new.go_fast

# Question 3: In the last question we had a module called Speed which contained
# a go_fast method. We included this module in the Car class as shown below

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow"
#   end
# end

# When we called the go_fast method from an instance of the Car class (as shown below)
# you might have noticed that the string printed when we go fast includes the name
# of the type of vehicle we are using. How is this done?

# Answer: In our go_fast method. we are calling self.class in string iterporlation
# which is giving us the name of the class that is calling the go_fast method. 
# that is why it prints to the screen the class name Car.

# Question 4: If we have a class AngryCat how do we create a new instance of 
# this class.

class AngryCat
  def hiss
    puts "Hissssss!!!!"
  end
end

AngryCat.new

# Using the .new after the class name will tell Ruby this new object
# is an instance of AngryCat

# Question 5: Which of these two classes has an instance variable and
# how do we know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

hot_pizza.instance_variables   # [:@name]
orange.instance_variables      # []

# name is just a normal variable, while @name is an instance variable
# the main difference is the @ symbol, if the @ symbol is in fornt of a variable
# it means it is an instance variable which will keep track of the information 
# of that object instance.

# Question 6: What could we add to the class below to access the 
# instance variable @volume ?

class Cube
  attr_reader :volume

  def initiialize(volume)
    @volume = volume
  end
end

# or

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

# Question 7: What is the default thing that Ruby will print to the screen
# if you call to_s on an object? Where could you go to find out if you want
# to be sure?

# It will print out the objects uniq id which holds its place in memory.

# Question 8: If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. 
# What does self refer to here?

# self refers to the instance object, or the calling object.

# Question 9: If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self. 
# What does self refer to in this context.

# self.cats_count is declaring the method as a class method.
# class methods act on the class itself. 
# so you could call Cat.cats_count

# Question 10: If we have the class below, what would you  need to call
# to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

new_bag = Bag.new('grey', 'leather')

# The class Bag needs two arguments when a new object is intiailized. 



















