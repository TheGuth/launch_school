# Classes and Objects - Part 1

# States and Behaviors:

# States -- track attributes for individual objects.

# Behaviors -- are what objects are capable of doing.

# two objects may contain different information, such as name, weight and height
# We could use instance variables to track this information, and is how objects
# keep track of their states.

# with two different objects they are both instances of the same class, and 
# contain identical behaviors. 

# good_dog.rb

class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new

# initialize method gets called every time you create a new object.

# constructor methods -- get triggered whenever we create a new object.

# good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

# @variable = instance variable is a variable that exists as long as the object
#             instance exists and it is one of the ways we tie data to objects.

sparky = GoodDog.new("Sparky")
puts sparky.speak

fido = GoodDog.new("Fido")
puts fido.speak

# Accessor Methods

# good_dog.rb

class GoodDog
  def initialize(name)
    @name = name
  end

  def name # Getter Method -- gets the state of an object
    @name      # returns the @name variable
  end

  def name=(n) # Setter Method -- sets the state of an object
    @name = n      # can set something to the variable @name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name
sparky.name = "Spartacus"
puts sparky.name

# attr_accessor method -- takes a symbol as an argument which it uses to create
#                         the method name for the getter and etter methods.

# attr_writer -- only a setter method 
# attr_reader -- only a getter method

# attr_accessor :name, :height, :weight (if your keeping track of more than one state.)

# good_dog.rb

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new("Sparky", '12 inches', '10 lbs')
puts sparky.info
puts sparky.speak
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info

# Exercises:

# Exercise 1:

class MyCar

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You put your foot to the gas and speed up #{number} mph"
  end

  def brake(number)
    @current_speed -= number
    puts "You put your foot on the brake and slow down to #{number} mph"
  end

  def current_speed
    puts "Your are now going #{@current_speed} mph"
  end

  def shut_off
    @current_speed = 0
    puts "You find a parking spot and turn the car off"
  end
end  

Focus = MyCar.new(2004, 'silver', 'Ford')
Focus.speed_up(30)
Focus.current_speed
Focus.brake(20)
Focus.current_speed
Focus.shut_off

# Exercise 2:

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You put your foot to the gas and speed up #{number} mph"
  end

  def brake(number)
    @current_speed -= number
    puts "You put your foot on the brake and slow down to #{number} mph"
  end

  def current_speed
    puts "Your are now going #{@current_speed} mph"
  end

  def shut_off
    @current_speed = 0
    puts "You find a parking spot and turn the car off"
  end
end  

Focus = MyCar.new(2004, 'silver', 'Ford')
Focus.speed_up(30)
Focus.current_speed
Focus.brake(20)
Focus.current_speed
Focus.shut_off

puts Focus.year
puts Focus.color = 'black'

# Exercise 3:

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You put your foot to the gas and speed up #{number} mph"
  end

  def brake(number)
    @current_speed -= number
    puts "You put your foot on the brake and slow down to #{number} mph"
  end

  def current_speed
    puts "Your are now going #{@current_speed} mph"
  end

  def shut_off
    @current_speed = 0
    puts "You find a parking spot and turn the car off"
  end

  def spray_paint(color)
    self.color = color
  end
end  

Focus = MyCar.new(2004, 'silver', 'Ford')
Focus.speed_up(30)
Focus.current_speed
Focus.brake(20)
Focus.current_speed
Focus.shut_off

puts Focus.year
puts Focus.color = 'black'
puts Focus.spray_paint('red')
puts Focus.color





















