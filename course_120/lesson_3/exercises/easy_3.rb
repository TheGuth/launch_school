# Exercises: Easy 3

# Question 1: If we have this code:

class Greeting
  def greet(messag)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi               # "Hello"

# case 2:

hello = Hello.new
hello.bye              # error no bye method in class Hello

# case 3:

hello = Hello.new
hello.greet            # error need 1 argument, but 0 arguments were passed

# case 4:

Hello = Hello.new
hello.greet("goodbye") # "goodbye"

# case 5:

Hello.hi               # An undefined method hi is reporded for Hello class.
                       # Hello.hi is calling for a class method not an instance method

# Question 2: In the last question we had the following classes:

class Greeting
  def greet(messag)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hell.hi we get an error message. How would you fix this?

Hello.new.hi

# or

# you could define the hi method on the Hello class as follows:

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

# Question 3: When objects are created they are a separate realization of a 
# particular class. Give the class below, how do we create two different instances
# of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hissssss!!!!"
  end
end

trinity = AngryCat.new(3, 'Trinity')
bob = AngryCat.new(5, 'bob')

# Question 4: Give the class below, if we created a new instance of the class and
# then called to_s on that instace we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

# How could we go about changing the to_s output on this method to look like
# this I am a tabby cat ? (this is assuming that "tabby" is the type we passed
  # in during initialization).

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

# Question 5: If i have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.maufacturer # error object can't call a class method.
tv.model # would work

Television.maufacturer # would work cause it calls a class method.
Television.model # error would be looking for a class method

# Question 6: If we have a class such as the one below:

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

# in the make_one_year_older method we have used self. What is another way
# we could write this method so we don't have to use the self prefix.

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# Question 7: What is used in the class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

# the return is unneccesary since we automatically return the last line of a method.




















